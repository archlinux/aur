# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=paperde
pkgver=0.2.1
pkgrel=2
pkgdesc="An awesome Desktop Environment built on top of Qt/Wayland and Wayfire."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/paper/${pkgname}"
license=('GPL3')
depends=('qt5-base' 'qt5-wayland' 'qt5-svg' 'qt5-tools' 'qt5ct' 'wayland' 'wayland-protocols' 'libcsys' 'libcprime' 'wayfire' 'libdbusmenu-qt5' 'xdg-desktop-portal'
		'dfl-wayqt' 'dfl-applications' 'dfl-ipc' 'dfl-login1' 'dfl-settings' 'dfl-status-notifier')
makedepends=('meson' 'ninja')
optdepends=('xdg-desktop-portal-gtk: GTK based XDG desktop portal implementation'
			'xdg-desktop-portal-kde: KDE Plasma based XDG desktop portal implementation'
			'xdg-desktop-portal-wlr: wlroots based XDG desktop portal implementation'
			'swaylock'
			'swayidle'
			'brightnessctl: for brightness control using the keyboard brightness key'
			'mako: for notifications'
			'playerctl: for keyboard media controls'
			'clipman: a clipboard manager for wayland')
source=("$url/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
		"DFL-v0.2.0.patch")
md5sums=('008511fd0274ffdb3dca05d4aafd6569'
         '8e075b81e67e50c94935760553d2a173')

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
