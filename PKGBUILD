# Maintainer: Andrea Zanellato <redtid3@gmail.com>

_prjname=wxcode
pkgname=${_prjname}-git
pkgver=1294.17815ef
pkgrel=1
pkgdesc="wxCode plugin for wxWeaver and custom wxWidgets controls library"
arch=("i686" "x86_64" "aarch64")
url="https://wxweaver.github.io"
license=("GPL2")
depends=("wxgtk3" "wxweaver")
makedepends=("git" "cmake")
source=("git://github.com/wxweaver/${_prjname}.git")
sha512sums=("SKIP")
pkgver() {
    cd "${srcdir}/${_prjname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "$srcdir/${_prjname}"
    git submodule update --init --recursive
}
build() {
    cd "${srcdir}/${_prjname}"
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/${_prjname}"
    cmake --build .
}
package() {
    cd "${srcdir}/${_prjname}"
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/${_prjname}/build" --target install
}
