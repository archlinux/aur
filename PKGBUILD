# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=middleclick-autoscroll
pkgver=1.2.0
pkgrel=1
pkgdesc="Middle-click autoscroll in every application that supports it"
arch=('any')
url="https://github.com/Felitendo/middleclick-autoscroll"
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'coreutils' 'gawk' 'grep' 'sed' 'gettext')
makedepends=('gettext' 'scdoc')
optdepends=('flatpak: cover Flatpak applications too'
            'spotify-launcher: cover the official Spotify client'
            'steam: cover the Steam interface'
            'desktop-file-utils: refresh the desktop database after a change')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ad192f791a4544a62cc135418670c69dc618aa0b6fc0cced2e460f03f2e1a0d')

build() {
  # pass the version being packaged so `middleclick-autoscroll --version`
  # cannot drift away from pkgver
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver"
}

package() {
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver" DESTDIR="$pkgdir" install
}
