# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# PGP key is on keyservers. To import:
#
#     gpg --receive-keys 7EF3061F5C8D5E25
#
# See https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
# for more details # on package signing.
pkgname=librepcb
pkgver=0.1.4
_pkgver=${pkgver/_/-}
pkgrel=3
pkgdesc="A free EDA software to develop printed circuit boards"
arch=('x86_64' 'i686')
url="http://librepcb.org/"
license=('GPL')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'qt5-base' 'qt5-svg')
makedepends=('qt5-tools')
source=(
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip"
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip.asc"
)
sha256sums=(
  '08299e8077f9ef4fb6df3fd5b22053b9ab6361411470809e2a1ee0f1ad9aadac'
  'SKIP'
)
validpgpkeys=('D6F9AF572228C5BCD6B538407EF3061F5C8D5E25')

build() {
  cd "${srcdir}/librepcb-${_pkgver}/"
  mkdir -p build && cd build
  qmake -r ../librepcb.pro CONFIG+=release PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/librepcb-${_pkgver}/build/"
  make install

  # Install development utils
  install -s -m 755 \
    "${srcdir}/librepcb-${_pkgver}/build/output/uuid-generator" \
    "${pkgdir}/usr/bin/librepcb-uuid-generator"
}

# vim:set ts=2 sw=2 et:
