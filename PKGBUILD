# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

_pkgname=Shell
pkgname=desq-shell
pkgver=0.0.8
pkgrel=7
pkgdesc="The Desktop Shell for Desq"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'qt5-x11extras'
        'libdbusmenu-qt5'
        'libxcomposite'
        'libdesqui'
        'curl'
        'libcanberra'
        'lm_sensors'
        'pam'
        'qt5-svg'
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
        'wayfire-plugins-dbusqt'
        'wayfire-plugins-desq-shell'
        'wayfire-plugins-toplevel-manager'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('bcbf647c870446b68d5fd191e401ad32831ddfef5824956a038484525c1cfe1a')

build() {
  cd "${_pkgname}-v${pkgver}"
  PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
