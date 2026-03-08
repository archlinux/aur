# Maintainer: czyt <czytcn@gmail.com>
pkgname=emdash-app
pkgver=0.4.27
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
sha256sums=('ba34a4210baba3fd30a65424904b1fe1a5c2f6d51baa32b192229318fb32017e')

package() {
  # Extract files from the .deb package.
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Expose executable in PATH.
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/Emdash/emdash "${pkgdir}/usr/bin/emdash"
}
