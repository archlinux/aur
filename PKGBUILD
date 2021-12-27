# Maintainer: Jesse McClure <code at jessemcclure dot org>
pkgname=silo-fossil
#pkgname=silo-nowayland-fossil
pkgver=r24.78ba44abe8
pkgrel=1
pkgdesc='Launcher menu with explosive potential (wayland or x11)'
arch=('x86_64')
license=('MIT')
depends=(gcc-libs glibc layer-shell-qt qt5-base)
#depends=(gcc-libs glibc qt5-base)
makedepends=(fossil)
url=https://code.jessemcclure.org/silo
source=(fossil+https://code.jessemcclure.org/silo)
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/silo"
	echo r$(fossil info | sed -n '$s/[a-z:-]* *//p').$(fossil timeline -n 1 -t ci -F %h | sed 1q)
}

build() {
	cd "${srcdir}/silo"
	make
	#make nowayland
}

package() {
	cd "${srcdir}/silo"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

