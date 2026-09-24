# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=cachy-auto-update
pkgver=1.3.1
pkgrel=1
pkgdesc="Unattended background updates for CachyOS, aware of battery, gaming and manual package management"
arch=('any')
url="https://github.com/LoonixTools/cachy-auto-update"
license=('GPL-3.0-or-later')
depends=('bash' 'systemd' 'pacman' 'pacman-contrib' 'util-linux' 'sudo'
         'gettext')
makedepends=('gettext' 'scdoc')
optdepends=('paru: AUR package updates'
            'yay: AUR package updates'
            'base-devel: required to build AUR packages'
            'flatpak: Flatpak updates'
            'libnotify: desktop notifications'
            'gearlever: AppImage updates'
            'python-gobject: progress bar in the desktop taskbar')
backup=('etc/cachy-auto-update/cachy-auto-update.conf'
        'etc/logrotate.d/cachy-auto-update')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9343da71b99ea21a5e960e227088e9f9b81696a97565cb9c175ad2d818b8ac67')

build() {
  # pass the version being packaged so `cachy-auto-update --version` cannot
  # drift away from pkgver
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver"
}

package() {
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver" DESTDIR="$pkgdir" install
}
