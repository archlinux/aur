# Maintainer: czyt <czytcn@gmail.com>
pkgname=emdash-app
pkgver=1.1.22
pkgrel=1
pkgdesc="Run multiple coding agents in parallel"
arch=('x86_64')
url="https://github.com/generalaction/emdash"
license=('MIT')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux'
  'libsecret'
)
optdepends=(
  'libappindicator-gtk3: for system tray icon support'
)
provides=('emdash')
conflicts=('emdash' 'emdash-bin')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/generalaction/emdash/releases/download/v${pkgver}/emdash-amd64.deb")
sha256sums=('06cea3fd44a438a24bda2f6cbeeb445d6f2f1bb65ef5932c8b3f85bb6bdd2d83')

package() {
  # Extract files from the .deb package.
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Expose executable in PATH.
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/Emdash/emdash "${pkgdir}/usr/bin/emdash"
}
