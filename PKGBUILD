# Maintainer: Hui Yiqun <huiyiqun@gmail.com>

pkgname=tmblock-git
pkgver=r31.79ead0c
pkgrel=2
pkgdesc="Tools to cancel video wateramrk"
arch=('x86_64')
url="https://github.com/TMBlock/libtmblock"
license=('MIT')
depends=('gcc-libs')
makedepends=('tar' 'git' 'cmake')
source=('git+https://github.com/TMBlock/libtmblock.git'
        'halide.tgz::https://github.com/halide/Halide/releases/download/release_2017_10_30/halide-linux-64-gcc53-trunk-3af238615667312dcb46607752e3ae5d0ec5d713.tgz')
noextract=('halide.tgz')
sha256sums=('SKIP'
            'f87361d55685856a38447f1c763d35c87fb511ae71b718ccbd079681aedf081b')

pkgver() {
    cd "$srcdir/libtmblock"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    tar -xzf "$srcdir/halide.tgz" -C "$srcdir/"
}

build() {
    cd "$srcdir/libtmblock"
    cmake -DHALIDE_DISTRIB_DIR="$srcdir/halide" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" .
    make
}

package() {
    cd "$srcdir/libtmblock"
    make install
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/tmblock-git/LICENSE.txt
}
