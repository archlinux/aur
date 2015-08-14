pkgname=minisat-git
pkgver=2.2.0.r68.g37dc6c6
pkgrel=2
pkgdesc='A minimalistic and high-performance SAT solver'
arch=('i686' 'x86_64')
url="http://minisat.se/"
license=('MIT')
makedepends=('git' 'cmake')
conflicts=('minisat')
source=($pkgname::git+https://github.com/niklasso/minisat.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^releases\///'
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
