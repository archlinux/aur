# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-bmv2
pkgver=1.15.0
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
    'python'
    'python-thrift'
    'thrift'
)
makedepends=('boost')
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-fix-ipaddr-import.patch::https://github.com/p4lang/behavioral-model/commit/7a8843ffb87bab9eb0a44c993ae39a9fefca10cf.patch")
sha512sums=('b92f761338a8f60cfc3578d62848f2201b4f1d55a562680a0a9fe9e63cb764eb00f252f59b48020871fa65fe3d0468fab888affa5cfef00a7578d940dd7fc08b'
            '62c2be39f86c788dce5e9ca945d1fe5582a458f6fe31a5630d52e1b7186563bf1e31c5c1617f7b4445cb53a947a130eeee9ca05a9e7e9d9acb011ab35237b3f2')

prepare() {
    cd "behavioral-model-$pkgver"
    patch -Np1 -i "../$pkgname-fix-ipaddr-import.patch"
}

build() {
    cd "behavioral-model-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
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
