# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=21.07
pkgrel=6
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=('LGPL' 'BSD' 'custom:unRAR')
arch=(x86_64)
makedepends=(uasm meson)
source=(https://7-zip.org/a/7z2107-src.7z
		01-gcc-12.patch
		meson.build)
sha256sums=('d1074d56f415aab99d99e597a7b66dc455dba6349ae8a4c89df76475b6a1284c'
            'e4d34366e091b8404dd04f02bcad46518d2930ec0b4a420e1316db020234b085'
            '642be36de3c1957d78b9e3ff24e511f8fe63b9b1ab3527efdb2adaacbeba702e')

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

