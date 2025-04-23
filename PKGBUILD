# Maintainer: Dan Johansen <strit@archlinux.org>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

_pkgname=Shell
pkgname=desq-shell
pkgver=0.0.9
pkgrel=1
pkgdesc="The Desktop Shell for Desq"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'libdbusmenu-lxqt'
        'bluez-qt'
        'libxcomposite'
        'libdesqui'
        'curl'
        'libcanberra'
        'lm_sensors'
        'nlohmann-json'
        'pam'
        'qt6-svg'
        'qt6-connectivity'
        'wayland-protocols'
        'hicolor-icon-theme'
        'dfl-utils'
        'dfl-xdg'
        'dfl-ipc'
        'dfl-applications'
        'dfl-settings'
        'dfl-layouts'
        'dfl-wayqt'
        'dfl-status-notifier'
        'dfl-hjsonparser'
        'dfl-colorschemeparser'
        'dfl-power'
        'dfl-login1'
        'dfl-inotify'
        'dfl-volume'
        'wayfire'
        'wayfire-plugins-extra'
        'wayfire-plugins-wfconfig-hjson'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('0dfdd345db8704e805be7136f883c2335c47338375a02f08b9f0f1cebfef4dc3')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
