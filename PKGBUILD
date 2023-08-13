# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="libacross"
pkgname=${_pkgbase}
pkgver=1.0.0
pkgrel=1
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="libacross path-finder with across implementation"
arch=("any")
license=('GPL3')
depends=('glibc')
makedepends=('make' 'cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/badcast/${pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('e5fd9cb1f40e1d8c0ba405cac835067156c1a815391f69f17bcaaf54f83cde49')

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
