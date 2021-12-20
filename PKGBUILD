# Maintainer: Jesse McClure <code at jessemcclure dot org>

pkgname=weaver-fossil
pkgver=r146.ec216dc060
pkgrel=1
pkgdesc='qt6-webengine browser w/ minimal UI'
arch=('x86_64')
license=('MIT')
depends=(gcc-libs glibc qt6-base qt6-webengine)
makedepends=(fossil)
optdepends=('qt6-wayland: run under wayland')
url=https://code.jessemcclure.org/weaver
source=(fossil+https://code.jessemcclure.org/weaver)
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/weaver"
	echo r$(fossil info | sed -n '$s/[a-z:-]* *//p').$(fossil timeline -n 1 -t ci -F %h | sed 1q)
}

build() {
	cd "${srcdir}/weaver"
	make
}

package() {
	cd "${srcdir}/weaver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
