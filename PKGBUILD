# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-luwen-git
pkgver=0.7.13.r6.gae98025
pkgrel=2
pkgdesc="Python package for the tenstorrent system interface library"
arch=('x86_64')
url='https://github.com/tenstorrent/luwen'
license=('Apache')
makedepends=(gcc rust make python python-pip maturin python-installer protobuf)
depends=()
provides=("python-luwen")
source=("luwen::git+https://github.com/tenstorrent/luwen.git")
sha256sums=('SKIP')

pkgver() {
  cd luwen
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
    cd luwen
    mkdir -p pybuild
    DEST_DIR="$PWD/pybuild" make whl
}

package() {
    cd luwen
    pwd
    python -m installer --destdir="$pkgdir" pybuild/*-linux*_x86_64.whl
}
