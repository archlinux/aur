# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-luwen-git
pkgver=0.4.3
pkgrel=1
pkgdesc="Python package for the tenstorrent system interface library"
arch=('x86_64')
url='https://github.com/tenstorrent/luwen'
license=('Apache')
makedepends=(gcc rust make python python-pip maturin python-installer)
depends=()
provides=("python-luwen")
source=("luwen::git+https://github.com/tenstorrent/luwen.git")
sha256sums=('SKIP')

pkgver() {
  cd luwen
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd luwen
    mkdir -p pybuild
    DEST_DIR="$PWD/pybuild" make whl
}

package_python-luwen-git() {
    cd luwen
    python -m installer --destdir="$pkgdir" pybuild/*linux_x86_64.whl
}
