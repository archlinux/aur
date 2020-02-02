# Maintainer: Anatol Pomozov <anatol pomozov at gmail>

pkgname=python2-rpm
pkgver=4.15.1
pkgrel=1
pkgdesc="Python2 bindings for RPM Package Manager"
arch=('x86_64')
url='http://www.rpm.org/'
license=('GPL2')
depends=('python2')
makedepends=('python2' 'nss')
source=(https://github.com/rpm-software-management/rpm/archive/rpm-$pkgver-release.zip)
sha256sums=('326284e6912f632601490aaa3321c0bbef091d981804a485fa2256c123b9222f')

prepare() {
	cd rpm-rpm-$pkgver-release

	autoreconf -i
}

build() {
	cd rpm-rpm-$pkgver-release

	./configure \
		--prefix=/usr  \
		--sysconfdir=/etc  \
		--localstatedir=/var \
		--enable-python \
		--without-lua \
		CPPFLAGS="`pkg-config --cflags nss`" \
		PYTHON=python2
	make
}

package() {
	cd rpm-rpm-$pkgver-release/python
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
