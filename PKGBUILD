# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Maintainer: Andrea Zanellato <redtid3@gmail.com>

_prjname=wxWeaver
pkgname=wxweaver-git
pkgver=2236.37fc5e28
pkgrel=1
pkgdesc="GUI Designer for wxWidgets"
arch=("i686" "x86_64" "aarch64")
url="https://wxweaver.github.io"
license=("GPL2")
provides=("wxweaver" "wxformbuilder")
conflicts=("wxweaver" "wxformbuilder" "wxformbuilder-svn")
depends=("wxgtk3")
makedepends=("git" "cmake")
source=("git://github.com/wxweaver/wxWeaver.git")
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
