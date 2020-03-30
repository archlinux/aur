# Maintainer: Ronny Lorenz <ronny@tbi.univie.ac.at>

pkgname=gapc-git
pkgver=r1.0.56.a30d19a
pkgrel=1
pkgdesc="The Bellman's GAP Compiler (GAP-C) is the novel ADP compiler which translates GAP-L programs into efficient C++ code."
url="https://bibiserv.cebitec.uni-bielefeld.de/gapc"
license=("GPL3")
arch=(i686 x86_64 arm armv6h armv7h aarch64)
depends=('boost' 'gsl' )
makedepends=('git' 'mercurial' 'flex' 'bison')
provides=(gapc)
conflicts=(gapc)
source=("git+https://github.com/RaumZeit/gapc.git")
sha256sums=("SKIP")

pkgver() {
    cd gapc
    printf "r1.0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd gapc
    ./configure --prefix=/usr
}

build() {
    cd gapc
    make
}

package() {
    cd gapc
    DESTDIR="${pkgdir}" make install
}
