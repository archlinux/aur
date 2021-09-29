# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jason Wood <jwood@startmail.com>

pkgname=headlines
pkgver=0.4.0
pkgrel=1
pkgdesc="GTK4 Reddit client"
arch=('x86_64')
url="https://gitlab.com/caveman250/headlines"
license=('GPL3')
depends=(
	'gtkmm-4.0'
	'libmicrohttpd'
	'curl'
	'jsoncpp'
	'libxml2'
	'ffmpeg'
	'gstreamer'
	'gst-plugins-base'
	'gst-plugins-good'
	'gst-plugins-bad'
	'gst-libav'
	'youtube-dl'
	'websocketpp'
	'libadwaita-git'
	'xdg-utils')
makedepends=('cmake' 'boost')
replaces=('gtkeddit')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/Headlines-$pkgver.tar.bz2")
sha256sums=('7c808a3d45c513d276cbb512ba220af431f9cc18e41774a7191cd129e4e2360f')

build() {
	cmake \
		-B build \
		-S "Headlines-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DDIST_BUILD=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir/"
}
