# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname='oshu'
pkgver=2.0.2
pkgrel=1
pkgdesc='Fast port of the osu! rhythm game'
url='https://github.com/fmang/oshu/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'ffmpeg' 'cairo' 'pango')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fmang/oshu/archive/$pkgver.tar.gz")
sha256sums=('2f576ffd87af58bc246f7e3277ec4193799648b56909a309990ba73af6070ad4')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DOSHU_DEFAULT_SKIN=osu
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
