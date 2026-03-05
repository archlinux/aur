# Maintainer: insmtr <insmtr@insmtr.cn>
pkgname=p4lang-pi
pkgver=0.1.0
pkgrel=1
pkgdesc="An implementation framework for a P4Runtime server"
arch=('x86_64')
url="https://github.com/p4lang/PI"
license=('Apache-2.0')
depends=(
    'grpc'
    'protobuf'
    'boost-libs'
    'readline'
)
makedepends=(
    'boost'
    'git'
)
source=("git+https://github.com/p4lang/PI.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=(!debug)

prepare() {
    cd PI
    git submodule update --init
}

build() {
    cd PI
    ./autogen.sh
    ./configure --prefix=/usr --with-proto
    make -j$(nproc)
}

package() {
    cd PI
    make DESTDIR="$pkgdir" install
}
