# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="library-brainmap"
pkgname=${_pkgbase}
pkgver=1.0.2
pkgrel=0
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="Brain Neuron Map - for Generate Maze and Path-Finder interface."
arch=("any")
license=('MIT')
depends=('glibc')
replaces=('libacross')
makedepends=('make' 'cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/badcast/${pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('025d63d0cfac1a507fc5444aec176dcf058f646872b0baddabaf7910505319c0')

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
