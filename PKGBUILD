pkgname=stp-git
pkgver=2.1.0.r4.g52b23b5
pkgrel=2
pkgdesc='Simple Theorem Prover'
arch=('i686' 'x86_64')
url="https://stp.github.io/"
license=('MIT')
makedepends=('git' 'cmake' 'boost')
depends=('minisat-git' 'cryptominisat4-git')
source=($pkgname::git+https://github.com/stp/stp.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../
    make
}

package() {
    cd "$srcdir/$pkgname"

    cd build
    make DESTDIR="$pkgdir/" install
}
