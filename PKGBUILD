# Maintainer: ghesy <ehsan at disroot dot org>

pkgname=luastatus-luajit
pkgver=0.6.0
pkgrel=2
pkgdesc='luastatus (a status bar content generator) built with luajit for better performance'
url='https://github.com/shdown/luastatus'
arch=('x86_64')
license=('LGPL3')
provides=('luastatus')
conflicts=('luastatus')
depends=('luajit>=2.0.0')
makedepends=(
	'cmake'
	'pkg-config'
	'python-docutils'
	'libxcb>=1.10'
	'yajl>=2.0.4'
	'alsa-lib>=1.0.27.2'
	'libpulse>=4.0'
	'libudev>=204.0'
	'libnl>=3.0'
	'glib2>=2.40.2'
	'libx11>=1.6.2'
	'xcb-util>=0.3.8'
	'xcb-util-wm>=0.4.1'
)
optdepends=(
	"libxcb>=1.10: for barlib 'dwm' and plugin 'xtitle'"
	"yajl>=2.0.4: for barlib 'i3'"
	"alsa-lib>=1.0.27.2: for plugin 'alsa'"
	"libpulse>=4.0: for plugin 'pulse'"
	"libudev>=204.0: for plugin 'battery-linux', 'backlight-linux' and 'udev'"
	"libnl>=3.0: for plugin 'network'"
	"glib2>=2.40.2: for plugin 'dbus'"
	"libx11>=1.6.2: for plugin 'xkb'"
	"xcb-util>=0.3.8: for plugin 'xtitle'"
	"xcb-util-wm>=0.4.1: for plugin 'xtitle'"
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b4ccebc771c315c137cd29ce3ab737ac28a4d32db6a4ac956405b33968fe4ddc')

build() {
	cd "luastatus-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
		-DWITH_LUA_LIBRARY=luajit -DBUILD_PLUGIN_PULSE=ON .
	make
}

package() {
	cd "luastatus-${pkgver}"
	make DESTDIR="$pkgdir" install
}
