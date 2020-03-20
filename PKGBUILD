# Maintainer: Tyler Johnson <tejohnso2 at popular google mail domain>
pkgname=slitherling
pkgver=90080eb
pkgrel=1
pkgdesc="A simple snake game. Feed your snake with fruit. Arrow keys, VIM keys, or spacebar (easy mode)."
arch=('i686' 'x86_64')
license=('GPL-3.0')
depends=('sfml')
source=("https://storage.googleapis.com/slitherling-source/src-$pkgver.tar.gz"
         "https://storage.googleapis.com/slitherling-source/resources-$pkgver.tar.gz")
md5sums=("SKIP" "SKIP")
makedepends=('gcc>=9.0.0' 'cmake>=3.11' 'ninja>=1.10')
epoch=1584662651
build() {
        cd $SRCDEST/src
        cp ../CMakeLists.txt .
	mkdir -p build
        cd build
        cmake -G "Ninja" -DCMAKE_BUILD_TYPE=MinSizeRel .. && ninja
}

package() {
        cd $SRCDEST
        install -m 755 -d "${pkgdir}/usr/bin"
        install -m 755 -t "${pkgdir}/usr/bin/" "src/build/src/main/slitherling"

        install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
        cp -r src/resources "${pkgdir}/usr/share/${pkgname}"
        install -m 755 -t "${pkgdir}/usr/share/${pkgname}" "SLITHERLING_VERSION"
}
