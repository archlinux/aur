pkgname=cppkafka-git
_gitname=cppkafka
pkgver=d3ef9ca
pkgrel=1
pkgdesc="Modern C++ Apache Kafka client library (wrapper for librdkafka)"
arch=('x86_64')
url="https://github.com/mfontanini/cppkafka"
license=('BSD')
depends=('librdkafka-git')
makedepends=('git' 'cmake')
source=("git+https://github.com/mfontanini/cppkafka")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd "$srcdir/$_gitname"
    cmake -DCPPKAFKA_DISABLE_TESTS=ON -DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DCMAKE_CXX_FLAGS=-flto -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package () {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir/" install
}
