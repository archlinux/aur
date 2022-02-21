pkgname=libzookeeper-git
pkgver=1.0
pkgrel=1
pkgdesc="zookepper client c install"
arch=('i686' 'x86_64')
url="https://github.com/apache/zookeeper"
license=('Apache')
makedepends=(maven autoconf automake cppunit pkgconf)
checkdepends=()
optdepends=()
provides=(libzookeper-git)
source=("git+https://github.com/apache/zookeeper.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/zookeeper/zookeeper-jute"
    mvn compile
    cd ../zookeeper-client/zookeeper-client-c
    autoreconf -if
    ./configure --prefix=/usr
}

package() {
    cd "$srcdir/zookeeper/zookeeper-client/zookeeper-client-c"
    make DESTDIR="$pkgdir/" install
}
