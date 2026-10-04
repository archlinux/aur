# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://git.felo.gg/Felitendo/PKGBUILDS

pkgname=cachy-auto-update
pkgver=1.3.2
pkgrel=1
pkgdesc="Unattended background updates for CachyOS, aware of battery, gaming and manual package management"
arch=('any')
url="https://git.felo.gg/LoonixTools/cachy-auto-update"
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0f680d222852a72197d1b6a3cad9d093d1c06257c55d9f58144b0403dc42adec')

build() {
  # pass the version being packaged so `cachy-auto-update --version` cannot
  # drift away from pkgver
  make -C "${pkgname}" VERSION="$pkgver"
}

package() {
  make -C "${pkgname}" VERSION="$pkgver" DESTDIR="$pkgdir" install
}
