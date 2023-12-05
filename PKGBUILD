# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

_pkgname=Shell
pkgname=desq-shell
pkgver=0.0.8
pkgrel=1
pkgdesc="The Desktop Shell for Desq"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libdbusmenu-qt5' 'libxcomposite' 'libdesqui' 'pam' 'qt5-svg' 'wayland-protocols'
        'dfl-utils' 'dfl-xdg' 'dfl-ipc' 'dfl-applications' 'dfl-settings' 'dfl-layouts' 'dfl-wayqt' 'dfl-status-notifier'
        'dfl-hjsonparser' 'dfl-colorschemeparser' 'dfl-power' 'dfl-login1' 'dfl-inotify'
        'wayfire' 'wayfire-plugins-extra' 'wayfire-plugins-wfconfig-hjson' 'wayfire-plugins-windecor' 'wayfire-plugins-dbusqt'
        'wayfire-plugins-focus-request' 'wayfire-plugins-desq-shell')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('063db58d9f9f062f4f72f562b4852ca8')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
