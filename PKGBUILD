# Maintainer: Tyler Johnson <tejohnso2 at popular google mail domain>
pkgname=slitherling
pkgver=f89a306
pkgrel=1
pkgdesc="A simple snake game. Feed your snake with fruit. Arrow keys, VIM keys, or spacebar (easy mode)."
arch=('i686' 'x86_64')
license=('GPL-3.0')
depends=('sfml')
source=("https://storage.googleapis.com/slitherling-source/src-$pkgver.tar.gz"
         "https://storage.googleapis.com/slitherling-source/resources-$pkgver.tar.gz")
makedepends=('gcc>=9.0.0' 'cmake>=3.11' 'ninja>=1.10')
epoch=1584659865
build() {
        cd ..
	mkdir -p build
        cd build
        cmake -G "Ninja" -DCMAKE_BUILD_TYPE=MinSizeRel .. && ninja
}

package() {
        cd ..
        install -m 755 -d "${pkgdir}/usr/bin"
        install -m 755 -t "${pkgdir}/usr/bin/" "build/src/main/slitherling"

        install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
        cp -r resources "${pkgdir}/usr/share/${pkgname}"
        chmod -R 755 "${pkgdir}/usr/share/${pkgname}/resources"
        install -m 755 -t "${pkgdir}/usr/share/${pkgname}" "SLITHERLING_VERSION"
}
