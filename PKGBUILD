# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=z80e
pkgver=0.3.0
pkgrel=1
license=('MIT')
pkgdesc='An emulation library and client programs for z80 calculators'
depends=("sdl")
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/z80e'
source=("https://github.com/KnightOS/z80e/archive/${pkgver}.tar.gz"
    "https://github.com/KnightOS/scas/archive/master.tar.gz")
sha1sums=('d5a43029926023afaed94f6be1b1259a7dd2b103'
          '48fbfa51ce97c306d95feb2e261872aed20b388a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    cp -R ../scas-master/* scas

	cmake -Denable-sdl=YES -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
