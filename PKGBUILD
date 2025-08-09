_pkgname="raygui"
pkgname=${_pkgname}
pkgver=4.0
pkgrel=1
pkgdesc="raygui is a simple and easy-to-use immediate-mode-gui library."
arch=('x86_64')
url="https://github.com/raysan5/raygui"
license=('MIT')
makedepends=()
depends=('raylib')
provides=("libraygui.so=${pkgver}")
conflicts=()
epoch=1
source=("${_pkgname}_${pkgver}.tar.gz::https://github.com/raysan5/raygui/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('299c8fcabda68309a60dc858741b76c32d7d0fc533cdc2539a55988cee236812')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cp src/raygui.h src/raygui.c
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  gcc -c -fPIC src/raygui.c -o raygui.o -DRAYGUI_IMPLEMENTATION
  gcc -shared raygui.o -o libraygui.so -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/libraygui.so" "${pkgdir}/usr/lib/libraygui.so"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/raygui.h" "${pkgdir}/usr/include/raygui.h"
}