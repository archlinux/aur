# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: David Birks <david@birks.dev>

pkgname=emdash-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Run multiple coding agents in parallel"
arch=('x86_64')
url="https://emdash.sh"
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
optdepends=(
  'libappindicator-gtk3: system tray icon support'
)
provides=('emdash')
conflicts=('emdash')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/generalaction/emdash/releases/download/v${pkgver}/emdash-amd64.deb")
sha256sums=('2041c2524ce167dca4abb9fd6c28efc954a36552abc726d274cd8d25ab24db16')

latestver() {
  gh api repos/generalaction/emdash/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Remove Debian changelog
  rm -rf "${pkgdir}/usr/share/doc"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/Emdash/emdash "${pkgdir}/usr/bin/emdash"
}
