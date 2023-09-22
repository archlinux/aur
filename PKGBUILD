# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="library-brainmap"
pkgname=${_pkgbase}
pkgver=1.0.1
pkgrel=1
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="Brain Neuron Map - for Generate Maze and Path-Finder interface."
arch=("any")
license=('MIT')
depends=('glibc')
replaces=('libacross')
makedepends=('make' 'cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/badcast/${pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('b194165a03b3df7633a032c475eca197b753a719068b597480cae916322c079f')

build(){
   cmake -S "${srcdir}/${_pkgbase}-${pkgver}" -B "${srcdir}/build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/

   cmake --build "${srcdir}/build"
}

check() {
    cd "${srcdir}/build"
	ctest -R
}

package(){
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

    install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
