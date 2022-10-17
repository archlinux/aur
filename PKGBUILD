# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

_pkgname=Shell
pkgname=desq-shell
pkgver=0.0.7
pkgrel=1
pkgdesc="The Desktop Shell for Desq"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libdbusmenu-qt5' 'libxcomposite' 'libdesqui' 'pam' 'qt5-svg' 'wayland-protocols'
        'dfl-utils' 'dfl-xdg' 'dfl-ipc' 'dfl-applications' 'dfl-settings' 'dfl-layouts' 'dfl-wayqt' 'dfl-status-notifier' 'dfl-login1' 'dfl-inotify')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('d659bd6a76ab61edb6e6e695976286f7')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
