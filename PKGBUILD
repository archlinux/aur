# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# PGP key is on keyservers. To import:
#
#     gpg --receive-keys 7EF3061F5C8D5E25
#
# See https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
# for more details # on package signing.
pkgname=librepcb
pkgver=0.1.6
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards"
arch=('x86_64' 'i686')
url="http://librepcb.org/"
license=('GPL')
depends=(
  'hicolor-icon-theme'
  'qt5-svg'
)
makedepends=(
  'cmake'
  'qt5-tools'
)
source=(
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip"
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip.asc"
)
sha256sums=(
  '8c7bf475ed59eb5b5e4b13073b96b9468ee01fb6980ef2b3471b1fbb39c46721'
  'SKIP'
)
validpgpkeys=('D6F9AF572228C5BCD6B538407EF3061F5C8D5E25')

build() {
  cd "${srcdir}/librepcb-${_pkgver}/"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DLIBREPCB_SHARE=/usr/share/librepcb
  make
}

package() {
  cd "${srcdir}/librepcb-${_pkgver}/build/"
  make install
}

# vim:set ts=2 sw=2 et:
