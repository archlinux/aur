# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=pycppad
pkgver=1.2.0
pkgrel=2
pkgdesc="CppAD python bindings"
arch=('i686' 'x86_64')
url="https://github.com/Simple-Robotics/$pkgname"
license=('BSD')
depends=('boost-libs' 'eigenpy' 'cppad' 'cppadcodegen')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python-numpy')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD' 'F182CC432A4752C7A3E4FE02001EB2069D785C81')

build() {
    cd "$pkgname-$pkgver"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib . \
        -DBUILD_WITH_CPPAD_CODEGEN_BINDINGS=ON
    make
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
