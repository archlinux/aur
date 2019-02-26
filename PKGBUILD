# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=stl-thumb
pkgver=0.3.0
pkgrel=1
license=('MIT')
pkgdesc="A fast lightweight thumbnail generator for STL files"
url='https://github.com/unlimitedbacon/stl-thumb'
source=(git://github.com/unlimitedbacon/stl-thumb.git)
depends=('libgl')
makedepends=("rust")
arch=("i386" "x86_64")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"

	git checkout tags/v${pkgver}
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 target/release/stl-thumb "${pkgdir}/usr/bin/stl-thumb"
	install -Dm644 stl-thumb.thumbnailer "${pkgdir}/usr/share/thumbnailers/stl-thumb.thumbnailer"
}
