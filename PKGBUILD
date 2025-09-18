# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-luwen
pkgver=0.7.13
pkgrel=2
pkgdesc="Python package for the tenstorrent system interface library"
arch=('x86_64')
url='https://github.com/tenstorrent/luwen'
license=('Apache')
makedepends=(gcc rust make python python-pip maturin python-installer protobuf)
depends=()
provides=("python-luwen")
conflicts=("python-luwen")
source=("luwen::git+https://github.com/tenstorrent/luwen.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd luwen
    mkdir -p pybuild
    DEST_DIR="$PWD/pybuild" make whl
}

package() {
    cd luwen
    python -m installer --destdir="$pkgdir" pybuild/*-linux*_x86_64.whl
}
