# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=meteor-decode-git
pkgver=r50.d1e317c
pkgrel=1
pkgdesc="Meteor-M2 LRPT decoder"
arch=(any)
license=(MIT)
url="https://github.com/dbdexter-dev/meteor_decode"
depends=(libpng)
makedepends=(git cmake)
provides=(meteor-decode)
conflicts=(meteor-decode)
source=("$pkgname::git+https://github.com/dbdexter-dev/meteor_decode.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"

    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${pkgname}/build"

    make DESTDIR=${pkgdir} install
}
