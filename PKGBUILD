# Maintainer: Kevin Masson <hi@oktomus.com>
pkgname=tev
pkgver=1.6
pkgrel=1
epoch=
pkgdesc="High dynamic range (HDR) image comparison tool for graphics people. Supports primarily OpenEXR files."
arch=("i686" "x86_64")
url="https://github.com/Tom94/tev"
license=('BSD-3-Clause')
depends=("zenity")
makedepends=("cmake")
provides=("tev")
conflicts=("tev")
install=
source=("tev::git+${url}.git")
md5sums=("SKIP")

pkgver() {
    git -C "tev" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

prepare() {
    git -C "tev" submodule update --init --recursive
    mkdir -p "tev/build"
}

build() {
    cd "tev/build" || exit 1
    cmake ..
    make -j
}

package() {
    cd "tev/build" || exit 1
    make install
    install -Dm644 "tev/LICENSE" "${pkgdir}/usr/share/licenses/tev/LICENSE"
}
