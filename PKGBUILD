# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jason Wood <jwood@startmail.com>

pkgname=headlines
pkgver=0.7.2
pkgrel=1
pkgdesc="GTK4 Reddit client"
arch=('x86_64')
url="https://gitlab.com/caveman250/headlines"
license=('GPL3')
depends=(
	'cairo'
	'ffmpeg'
	'gst-libav'
	'gst-plugins-bad'
	'gst-plugins-base'
	'gst-plugins-good'
	'gstreamer'
	'libadwaita'
	'libcurl.so'
	'libgtkmm-4.0.so'
	'libjsoncpp.so'
	'libmicrohttpd.so'
	'libsecret-1.so'
	'libxml2.so'
	'openssl'
	'websocketpp'
	'xdg-utils'
	'youtube-dl')
makedepends=('cmake' 'boost')
replaces=('gtkeddit')
source=("$pkgname-$pkgver.tar.bz2::$url/-/archive/$pkgver/Headlines-$pkgver.tar.bz2")
sha256sums=('98863f5d0230600394f66d9467cfaa869c0206bcda36b2f8a5004eee03e973e4')

prepare() {
	cd "Headlines-$pkgver"
	sed -i '/CXX_FLAGS_RELEASE/s/O3/O2/' CMakeLists.txt
}

build() {
	cmake \
		-B build \
		-S "Headlines-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DDIST_BUILD=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
