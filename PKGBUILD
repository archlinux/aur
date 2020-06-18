# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg=coin-or
_pkgname=CppAD
pkgname=cppad
pkgver=20200000.3
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$_pkgname"
license=('GPL2')
depends=('gcc-libs')
optdepends=()
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b37f3bc13d1e653828fefec604260d93224dc66a5f70da5500bc7bf2ba13c3d3')

build() {
    cd "$_pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    rmdir $pkgdir/usr/include/cppad/{local/,}CMakeFiles
}
