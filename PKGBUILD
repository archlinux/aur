# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=middleclick-autoscroll
pkgver=1.7.1
pkgrel=1
pkgdesc="Middle-click autoscroll in every application that supports it"
arch=('any')
url="https://github.com/LoonixTools/middleclick-autoscroll"
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'coreutils' 'gawk' 'grep' 'sed' 'gettext')
makedepends=('gettext' 'scdoc')
optdepends=('flatpak: cover Flatpak applications too'
            'spotify-launcher: cover the official Spotify client'
            'steam: cover the Steam interface'
            'desktop-file-utils: refresh the desktop database after a change')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f91abbd32009714a312eebf13939e3ad38e9f116f38d510115843c0fe4c6be17')

build() {
  # pass the version being packaged so `middleclick-autoscroll --version`
  # cannot drift away from pkgver
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver"
}

package() {
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver" DESTDIR="$pkgdir" install
}
