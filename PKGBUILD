# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=ffmpegyag
pkgver=0.7.7
pkgrel=2
pkgdesc="Simple FFmpeg GUI for Linux & Windows"
arch=("i686" "x86_64")
url="https://sourceforge.net/projects/ffmpegyag"
license=('MIT')

depends=("ffmpeg2.8" "wxgtk3")
makedepends=('gcc' 'ninja' 'meson')
_short="${pkgname}-${pkgver}"
source=("https://github.com/SolarAquarion/ffmpegyag/archive/${pkgver}.tar.gz")

sha256sums=('0c88cc9a80b687ea7c57c8f8ba556627eab3bcf98898af93c4ee6a1c1ec51e56')

build() {
	cd "$_short"
        export CFLAGS="${CFLAGS} -I/usr/include/ffmpeg2.8" 
        export LDFLAGS="${LDFLAGS} -L/usr/lib/ffmpeg2.8" 
        export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}/usr/lib/ffmpeg2.8/pkgconfig"
	arch-meson build
	ninja -C build
}

package() {
	cd "$_short"
	DESTDIR="$pkgdir/" ninja -C build install
}

