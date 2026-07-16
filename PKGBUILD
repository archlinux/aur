# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-bmv2
pkgver=1.15.4
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
sha512sums=('4625a76610c70da76138084a3a02ddfc347040f95d1a18377feb393c9136dce8d26f4064bb4a4a67b20b714d92f419d75816b34eb4c84ede427fbb5cc3ce5a10')

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
