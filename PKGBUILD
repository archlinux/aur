# Maintainer: YangZhichao<1036711084@qq.com>
# Cotributor: Guilhem Saurel <saurel@laas.fr>

pkgname=osqp-git
pkgver=v1.0.0.beta1.r9.g1704870
pkgrel=1
pkgdesc="The Operator Splitting QP Solver"
arch=('i686' 'x86_64')
url="https://github.com/osqp/osqp"
license=('apache')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=()
optdepends=()
makedepends=('cmake' 'python-scipy' 'git')
source=("osqp-git::git+https://github.com/osqp/osqp.git")
options=('staticlibs')
sha256sums=(SKIP)
pkgver() {
  cd $srcdir/osqp-git
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd $srcdir/osqp-git
    cmake -B build \
        -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib  \
        -DUNITTESTS=ON -DENABLE_MKL_PARDISO=OFF \
        -DDLONG=OFF \
        -DPRINTING=OFF
    cmake --build build
}


package() {
    cd $srcdir/osqp-git
    DESTDIR="$pkgdir/" cmake --build build -t install
}
