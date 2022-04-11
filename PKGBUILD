# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bastien Traverse <neitsab at esrevart dot net>
# Contributor: David Runge <dvzrv@archlinux.org>

## GPG key: https://github.com/lazka.gpg

_name=mutagen
pkgname=python2-mutagen
pkgver=1.43.1
pkgrel=2
arch=('any')
pkgdesc="An audio metadata tag reader and writer (python2 library)"
url="https://github.com/quodlibet/mutagen"
license=('GPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/release-$pkgver/$_name-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::$url/releases/download/release-$pkgver/$_name-$pkgver.tar.gz.sig"
				'python2.patch')
sha256sums=('d873baeb7815311d3420aab0a1d83f050f628228cbc2d6045a14a16460411bc9'
            'SKIP'
            'f529b4f9aaeb5a6f8a12ab90361be671bc65c2abdb6ac78e70a776dd59c97abc')
validpgpkeys=('0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC') # Christoph Reiter <reiter.christoph@gmail.com>

prepare() {
	patch -p1 -d "$_name-$pkgver" < python2.patch
}

build() {
	cd "$_name-$pkgver"
	python2 setup.py build
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
}
