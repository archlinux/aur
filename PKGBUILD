# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jason Wood <jwood@startmail.com>

pkgname=headlines
pkgver=0.5.3
pkgrel=1
pkgdesc="GTK4 Reddit client"
arch=('x86_64')
url="https://gitlab.com/caveman250/headlines"
license=('GPL3')
depends=(
	'gtkmm-4.0'
	'libmicrohttpd'
	'libcurl.so'
	'openssl'
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
	'libadwaita'
	'xdg-utils'
	'libsecret')
makedepends=('cmake' 'boost')
replaces=('gtkeddit')
source=("$pkgname-$pkgver.tar.bz2::$url/-/archive/$pkgver/Headlines-$pkgver.tar.bz2")
sha256sums=('6d69030d754d1b54ffab4a3fa7091d75fb4d79ac4e413476edd9c631992d386c')

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
