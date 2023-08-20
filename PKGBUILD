# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="library-brainmap"
pkgname=${_pkgbase}
pkgver=1.0.0
pkgrel=0
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="Brain Neuron Map - for Generate Maze and Path-Finder interface."
arch=("any")
license=('GPL3')
depends=('glibc')
replaces=('libacross')
makedepends=('make' 'cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/badcast/${pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('0aee8e327c2d5978c5065996cd29512dbd5d86b0b067790d78cc726660dc16be')

build(){
   cmake -S "${srcdir}/${_pkgbase}-${pkgver}" -B "${srcdir}/build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/

   cmake --build "${srcdir}/build"
}

check() {
    cd "${srcdir}/build"
	ctest -R "Test1|Test2"
}

package(){
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
}
