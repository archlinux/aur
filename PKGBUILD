# Maintainer: Andrew Sun <adsun701@gmail.com>
pkgname=aces-container
_srcname=aces_container
pkgver=1.0.2
pkgrel=1
pkgdesc="ACES Container Reference Implementation"
arch=('x86_64')
url="https://github.com/ampas/aces_container"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/ampas/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('cbbba395d2425251263e4ae05c4829319a3e399a0aee70df2eb9efb6a8afdbae')

prepare() {
	cd "${srcdir}/${_srcname}-${pkgver}"
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "../${_srcname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
