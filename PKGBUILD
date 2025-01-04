# Maintainer: Vladimir Demenev <vademenev [at] gmail [dot] com>

# *********************************************
# 1) For compile the package to run:
#    makepkg -fs
#
# 2) For install/upgrade package to run:
#    sudo pacman -U bastyon-bin-0.9.107-1-x86_64.pkg.tar.xz
#
# 3) For delete package run:
#    sudo pacman -Rsn bastyon-bin
# 
# *********************************************

pkgname=bastyon-bin
pkgrel=2
pkgdesc="Decentralized social network based on the blockchain"
arch=(x86_64)
url="https://github.com/pocketnetteam/pocketnet.gui"
license=("Apache-2.0")
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libutil-linux' 'libsecret')
# options=(!debug)

_get_latest_version() {
  curl -s "https://api.github.com/repos/pocketnetteam/pocketnet.gui/tags" | jq -r '.[0].name' | sed 's/^v//'
}

pkgver=$(_get_latest_version)
source=("https://github.com/pocketnetteam/pocketnet.gui/releases/download/v${pkgver}/BastyonSetup.deb")
sha256sums=('SKIP')

prepare() {
  bsdtar -xf "${srcdir}/BastyonSetup.deb" -C "${srcdir}"
}

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
