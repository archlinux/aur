# Maintainer: Matthew Hague <matthewhague@zoho.com>
# Maintainer: Max Mazurov <fox.cpp@disroot.org>
# Based on PKGBUILD/install by: Maarten Baert <maarten-baert@hotmail.com>

pkgname=simplescreenrecorder-wlroots-git
pkgver=0.3.11.r23.g4b288cb
pkgrel=1
pkgdesc="Experimental fork of simplescreenrecorder with added Wayland support"
arch=("x86_64")
url="https://github.com/foxcpp/ssr-wlroots"
license=("GPL3")
depends=("qt5-base" "qt5-x11extras"
    "ffmpeg" "alsa-lib" "libpulse" "jack" "libgl" "glu"
    "libx11" "libxext" "libxfixes" "libxi"
    "desktop-file-utils" "gtk-update-icon-cache"
    "wayland")
makedepends=("git" "cmake" "qt5-tools" "wayland-protocols")
source=("git+https://github.com/foxcpp/ssr-wlroots")
md5sums=("SKIP")
conflicts=("simplescreenrecorder" "simplescreenrecorder-git")
provides=("simplescreenrecorder")

install=simplescreenrecorder-wlroots-git.install

pkgver() {
	cd ssr-wlroots
	# Use the tag of the last commit
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
prepare() {
	cd ssr-wlroots
	mkdir -p build
}
build() {
	cd ssr-wlroots/build
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_BUILD_TYPE=Release -DWITH_QT5=TRUE ..
	make
}
package() {
	cd ssr-wlroots/build
	make DESTDIR="$pkgdir" install
}
