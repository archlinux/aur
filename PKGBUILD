# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=paperde
pkgver=0.1.0
pkgrel=1
pkgdesc="An awesome Desktop Environment built on top of Qt/Wayland and Wayfire."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/paper/${pkgname}"
license=('GPL3')
depends=('qt5-base' 'qt5-wayland' 'qt5-svg' 'qt5-tools' 'qt5ct' 'wayland' 'wayland-protocols' 'libcsys' 'libcprime' 'wayfire' 'libdbusmenu-qt5' 'upower' 'xdg-desktop-portal')
makedepends=('cmake' 'ninja' 'extra-cmake-modules')
optdepends=('xdg-desktop-portal-gtk: GTK based XDG desktop portal implementation'
			'xdg-desktop-portal-kde: KDE Plasma based XDG desktop portal implementation'
			'xdg-desktop-portal-wlr: wlroots based XDG desktop portal implementation'
			'swaylock'
			'swayidle'
			'brightnessctl: for brightness control using the keyboard brightness key'
			'mako: for notifications'
			'playerctl: for keyboard media controls'
			'clipman: a clipboard manager for wayland')
source=("$url/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('e0aa427e237944b97dac982350601b56')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
	-GNinja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DPKGSHAREDPATH=share/paperde
  ninja
}

package() {
  cd build
  DESTDIR="${pkgdir}" ninja install
} 
