# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=stl-thumb
pkgver=0.4.0
pkgrel=1
license=('MIT')
pkgdesc="A fast lightweight thumbnail generator for STL files"
url='https://github.com/unlimitedbacon/stl-thumb'
source=(git://github.com/unlimitedbacon/stl-thumb.git)
depends=('libgl')
makedepends=("rust" "git")
arch=("i386" "x86_64")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"

	git checkout tags/v${pkgver}
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 target/release/stl-thumb       "${pkgdir}/usr/bin/stl-thumb"
	install -Dm755 target/release/libstl_thumb.so "${pkgdir}/usr/lib/libstl_thumb.so"
	install -Dm644 target/release/libstl_thumb.a  "${pkgdir}/usr/lib/libstl_thumb.a"
	install -Dm644 stl-thumb.thumbnailer          "${pkgdir}/usr/share/thumbnailers/stl-thumb.thumbnailer"
	install -Dm644 libstl_thumb.h                 "${pkgdir}/usr/include/libstl_thumb.h"
}
