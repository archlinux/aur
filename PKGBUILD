# Maintainer: Bruno Silva <brunofernandes at ua dot pt>

pkgname=asn1c-mouse07410-git
_pkgname=asn1c
pkgver=v1.0.0.r60.g165e8504
pkgrel=1
pkgdesc="An ASN.1 compiler mouse07410 Fork from vlm/asn1c"
arch=('i686' 'x86_64')
url="http://lionet.info/asn1c/blog/"
license=('GPL3')
depends=(glibc)
makedepends=(glibc git autoconf gcc flex automake libtool bison)
optdepends=()
provides=('asn1c')
conflicts=('asn1c')
options=('!strip')
source=(git+https://github.com/mouse07410/asn1c.git#branch=master)
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -iv && ./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}
