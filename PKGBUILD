# Maintainer: Ling Wang <lingwang@wcysite.com>
_pkgname=sd-mux-ctrl
_reponame=badgerd-sdwirec
pkgname=sd-mux-ctrl-git
pkgver=1.3
pkgrel=0
pkgdesc="Software interact with SDWireC."
arch=("x86_64" "arm64" "riscv64")
url="https://github.com/Badger-Embedded/badgerd-sdwirec"
license=('Apache-2.0')
makedepends=('git' 'base-devel' 'cmake' 'pkgconf' 'make' 'gcc')
depends=('libftdi' 'popt')
provides=('sd-mux-ctrl=$pkgver')

source=(git+https://github.com/Badger-Embedded/$_reponame.git#branch=main)
sha256sums=('SKIP')


build() {
    cd "$srcdir/$_reponame"

    cd sdwirec-sw

    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
    make
}

package() {
    cd "$srcdir/$_reponame"
    cd sdwirec-sw/build
    make install
}
