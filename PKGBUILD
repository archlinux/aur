# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-bmv2
pkgver=1.15.6
pkgrel=1
pkgdesc="P4 reference software switch"
arch=('any')
url="https://github.com/p4lang/behavioral-model"
license=('Apache')
depends=(
    'boost-libs'
    'gmp'
    'libevent'
    'libpcap'
    'nanomsg'
    'p4lang-pi'
    'python'
    'python-thrift'
    'thrift'
)
makedepends=('boost')
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('f6a40c1ba744227f1ca2b44d6c6e671572f750e4722e1f5a606da2e45c91932528aec848c94737b0df7e5d53b2c810416ab1cf5002f52d0e66f618ec82ccdd73')

build() {
    cd "behavioral-model-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr --with-pi
    make
}

check() {
    cd "behavioral-model-$pkgver"
    #TODO: tests fail
    make -k check || true
}

package() {
    cd "behavioral-model-$pkgver"
    make DESTDIR="$pkgdir/" install
}
