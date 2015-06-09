# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-panel
pkgname=$_pkgname-git
pkgver=0.9.0.155.gbc4d32b
pkgrel=1
pkgdesc="The LXQt desktop panel"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=(
	"kwindowsystem" "kguiaddons" "solid" "lxqt-globalkeys"
	"menu-cache" "libxcomposite" "lxmenu-data"
)
optdepends=(
	"alsa-lib: Recompile for Alsa support in volume control plugin"
	"libpulse: Recompile for PulseAudio support in volume control plugin"
	"lm_sensors: Recompile for Sensors (battery) plugin"
	"libstatgrab: Recompile for network and CPU monitor plugin"
	"libsysstat: Recompile for network and CPU monitor plugin"
)
makedepends=("git" "cmake" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/$_pkgname.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
