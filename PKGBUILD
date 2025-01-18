# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=paperde
pkgver=0.2.1
pkgrel=4
pkgdesc="An awesome Desktop Environment built on top of Qt/Wayland and Wayfire."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/paper/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'qt5-wayland'
        'qt5-svg'
        'qt5-tools'
        'qt5ct'
        'wayland'
        'wayland-protocols'
        'libcsys'
        'libcprime'
        'wayfire'
        'libdbusmenu-qt5'
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
source=("$url/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        "DFL-v0.2.0.patch")
sha256sums=('40a1ca455869f6e55592579359530f5ce0031694d6f87b28c2956fb00d6bd8e5'
            'fc3f215e296230424eda8bf23c41d455e550412e72fb77c1524d4acf017c3b63')

prepare() {
  cd "${pkgname}-v${pkgver}"
  patch -Np1 -i "${srcdir}/DFL-v0.2.0.patch"
}

build() {
  cd "${pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
