# Maintainer: Dan Johansen <strit@archlinux.org>

pkgname=paperde
pkgver=0.3.0
pkgrel=1
pkgdesc="An awesome Desktop Environment built on top of Qt/Wayland and Wayfire."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/paper/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt6-base'
        'qt6-wayland'
        'qt6-svg'
        'qt6-tools'
        'qt6ct'
        'wayland'
        'wayland-protocols'
        'libcsys'
        'libcprime'
        'wayfire'
        'libdbusmenu-lxqt'
        'xdg-desktop-portal'
        'dfl-wayqt'
        'dfl-applications'
        'dfl-ipc'
        'dfl-login1'
        'dfl-settings'
        'dfl-status-notifier'
)
makedepends=(
            'meson'
            'ninja'
)
optdepends=(
           'xdg-desktop-portal-gtk: GTK based XDG desktop portal implementation'
           'xdg-desktop-portal-kde: KDE Plasma based XDG desktop portal implementation'
           'xdg-desktop-portal-wlr: wlroots based XDG desktop portal implementation'
           'swaylock'
           'swayidle'
           'brightnessctl: for brightness control using the keyboard brightness key'
           'mako: for notifications'
           'playerctl: for keyboard media controls'
           'clipman: a clipboard manager for wayland'
)
source=("$url/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('aa3fd1eaea300a8cb68554003aae3db0309791dfe8d913f99c57751d68dff417')

build() {
  cd "${pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
