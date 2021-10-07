# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Victor Engmark <victor.engmark@gmail.com>

pkgname=python-vcard
pkgver=0.14.1
pkgrel=1
pkgdesc="vCard validator"
arch=('any')
url='https://gitlab.com/victor-engmark/vcard'
license=('AGPL3')
depends=('python-dateutil')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.bz2::$url/-/archive/v$pkgver/vcard-v$pkgver.tar.bz2")
sha512sums=('8e07db501e7974301d680286c900bab687439d0ce542c94c4d399c6c0e855107ef2a6e9252667870e22debcdc30d5bda92587b43d06837d8789922ded8eda178')

prepare() {
	cd "vcard-v$pkgver"
	sed -i '/data_files/d' setup.py
}

build() {
	cd "vcard-v$pkgver"
	python setup.py build
}

package() {
	cd "vcard-v$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 bash-completion/vcard -t "$pkgdir/usr/share/bash-completion/completions/"
}
