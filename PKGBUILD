# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-bmv2
pkgver=1.15.2
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
sha512sums=('f6a2d6c982638ed568d5c95964cf604a9866b8838406af0bb641da98a786f1eaff437ff594c36082d8c7f8a29da625dc0295d16f73cd9724fdf7a1e496a8fd86')

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
