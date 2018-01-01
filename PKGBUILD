# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: ovi chis <ovi@ovios.org>

pkgname=libqb
pkgver=1.0.3
pkgrel=1
pkgdesc='Library with the primary purpose of providing high performance client server reusable features'
arch=("i686" "x86_64" "mips64el")
makedepends=("doxygen" "splint")
license=("LGPL2.1")
options=(!libtool)
url="https://github.com/ClusterLabs/${pkgname}"
source=("https://github.com/ClusterLabs/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('6053ccb497513ae3e420841747c1cf05dea50a0b11d9aa0b02d41971a4e3d2a1'
            'SKIP')
validpgpkeys=('EA78541A2D92451106C8A1F7B67157F3A70D4537')

build() {
cd "${srcdir}/${pkgname}-${pkgver}"
  setarch ${CARCH} ./autogen.sh
  setarch ${CARCH} ./configure --prefix=/usr\
    --disable-fatal-warnings\
    --disable-static\
    --libdir=/usr/lib\
    --sbindir=/usr/bin
  setarch ${CARCH} make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  setarch ${CARCH} make DESTDIR="${pkgdir}" install
}
