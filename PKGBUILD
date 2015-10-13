# Maintainer: Narthorn <narthorn@gmail.com>

_pkgname=asn1c
pkgname=openio-$_pkgname-git
pkgver=v0.9.27.1.r0.g9458209
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc=('The ASN.1 to C compiler (openio fork, latest git)')
url='http://github.com/open-io/asn1c.git'
license=('custom')
makedepends=('git')
depends=('')
optdepends=('perl: for crfc2asn.pl (extract ASN.1 data from RFC files)')
provides=($_pkgname "openio-asn1c")
conflicts=($_pkgname "openio-asn1c")
source=('git://github.com/open-io/asn1c.git')
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	autoreconf -vi
	./configure --prefix=/usr
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install
	install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
