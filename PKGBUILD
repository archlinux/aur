# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=22.00
pkgrel=2
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=('LGPL' 'BSD' 'custom:unRAR')
arch=(x86_64)
makedepends=(uasm meson)
source=(https://7-zip.org/a/7z2200-src.tar.xz
		01-gcc-12.patch
		meson.build)
sha256sums=('40969f601e86aff49aaa0ba0df5ce6fd397cf7e2683a84b591b0081e461ef675'
            'e4d34366e091b8404dd04f02bcad46518d2930ec0b4a420e1316db020234b085'
            'd1171dd766792cb9d927aed289a7c5bddbd328bf1bcbbf3ed74311abf1e24be5')

prepare() {
	patch -Np1 -i 01-gcc-12.patch
}

build() {
	arch-meson . build

	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}

