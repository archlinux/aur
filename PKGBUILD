# Contributor: Jesse McClure <code@jessemcclure.org>

pkgname=weaver-fossil
pkgver=r110.2a5e04de98
pkgrel=1
pkgdesc='socket-controlled qt5webengine browser w/ minimal UI'
arch=('x86_64')
license=('MIT')
depends=(gcc-libs glibc qt5-base qt5-webengine)
makedepends=(fossil)
url=https://code.jessemcclure.org/weaver
VCSCLIENTS+=(fossil::fossil)
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

