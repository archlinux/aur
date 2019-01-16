# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=nixio-git
pkgver=1.5.dev
pkgrel=1
pkgdesc='Neuroscience information exchange format (master branch)'
arch=('x86_64')
url='http://g-node.github.io/nix/'
license=('BSD')
depends=('hdf5' 'boost')
makedepends=('cmake')
conflicts=('nixio')
sha512sums=('SKIP')
source=("nixio::git+https://github.com/G-Node/nix")

pkgver() {
    cd ${pkgname%-git}
    shorthash=$(git rev-parse --short HEAD)
    revcount=$(git rev-list --count HEAD)
    echo "${revcount}.${shorthash}"
}

build() {
    cd "nixio"

    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
    make
}

package() {
    cd "nixio/build"
    make DESTDIR="${pkgdir}/" install
}
