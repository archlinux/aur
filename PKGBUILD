# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
_pkgname="setcolors"
pkgname="${_pkgname}-git"
pkgdesc="Allows you to set the linux VT101 default color palette"
license=('MIT')
url="https://github.com/evanpurkhiser/linux-vt-setcolors"
pkgver=1.0.0.r7.g1dccf7c
pkgrel=1
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')
depends=('glibc')
makedepends=('git')
arch=('i686' 'x86_64')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make CFLAGS="$CFLAGS $LDFLAGS"
}

package() {
	cd "$srcdir/$pkgname"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
