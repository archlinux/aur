# Maintainer: Ronny Lorenz <ronny@tbi.univie.ac.at>

_basever=2020.12.08
pkgname=gapc-git
pkgver="${_basever}.301.f58a1c2"
pkgrel=1
pkgdesc="The Bellman's GAP Compiler (GAP-C) is the novel ADP compiler which translates GAP-L programs into efficient C++ code."
url="https://bibiserv.cebitec.uni-bielefeld.de/gapc"
license=("GPL3")
arch=(i686 x86_64 arm armv6h armv7h aarch64)
depends=('boost' 'gsl' )
makedepends=('git' 'mercurial' 'flex' 'bison')
provides=(gapc="${pkgver}")
conflicts=(gapc)
source=("git+https://github.com/jlab/gapc.git")
sha256sums=("SKIP")

pkgver() {
    cd gapc
    printf "${_basever}.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    make PREFIX="${pkgdir}/usr" install
}
