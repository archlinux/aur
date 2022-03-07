# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: silverhikari

pkgname=audacium
pkgver=1.0.0
pkgrel=3
pkgdesc='telemetry free version of audacity'
arch=(x86_64)
url="https://github.com/SartoxOnlyGNU/$pkgname"
license=(GPL2)
depends=(alsa-lib
         expat
         ffmpeg4.4
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
sha256sums=('7b8a98c349601b9a1248d906839f78396eefba051dddd8d63e1a7d6f416d02c8')

build() {
	cd "$_archive"
	cmake \
		-G 'Unix Makefiles' \
		-Daudacity_use_ffmpeg=loaded \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-B build \
		-S . \
		..
	make -C build
}

package() {
	cd "$_archive/build"
	make DESTDIR="$pkgdir/" install
}
