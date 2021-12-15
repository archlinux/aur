# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: silverhikari

pkgname=audacium
pkgver=1.0.0
pkgrel=1
pkgdesc='telemetry free version of audacity'
arch=(x86_64)
url="https://github.com/SartoxOnlyGNU/$pkgname"
license=(GPL2)
depends=(alsa-lib
         expat
         ffmpeg
         gtk2
         libid3tag
         libmad
         libogg
         libsndfile
         libsoxr
         libvorbis
         libx11
         lilv
         lv2
         portsmf
         soundtouch
         suil
         twolame
         vamp-plugin-sdk)
makedepends=(cmake
             sdl2
             libsoup
             libnotify
             gstreamer
             gst-plugins-bad-libs
             jack
             nasm
             conan)
provides=(audacity)
conflicts=(audacity)
_archive="$pkgname-$pkgver-rel"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver-rel.tar.gz")
md5sums=('SKIP')

build() {
	cd "$_archive"
	cmake -B build \
		-S audacium \
		-G 'Unix Makefiles' \
		-Daudacity_use_ffmpeg=loaded \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		..
	make -C build
}

package() {
	cd "$_archive"
	cd build
	make DESTDIR="$pkgdir/" install
}
