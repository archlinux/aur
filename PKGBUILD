# Maintainer: David Birks <david@birks.dev>

pkgname=emdash-bin
pkgver=0.3.41
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
conflicts=('emdash')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/generalaction/emdash/releases/download/v${pkgver}/emdash-amd64.deb")
sha256sums=('f8499b2ab34e917d301b00ad844da7dc19aefe78191d4b01e4cc8ecc03bc8159')

package() {
  # Extract the .deb package
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Create symlink to /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/emdash/emdash "${pkgdir}/usr/bin/emdash"
}
