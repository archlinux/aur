# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>
# Contributor: Riccardo Berto <riccardobrt at gmail dot com>

pkgname=redis-graph
_name=RedisGraph
pkgver=2.12.10
pkgrel=1
pkgdesc="A graph database as a Redis module"
arch=('x86_64')
url="https://redis.io/docs/stack/graph/"
license=("custom:SSPL1")
makedepends=('git' 'cmake' 'peg')
depends=('redis')
conflicts=('redis-graph-git')
_tag=3c832112b6e0a1564930ebac838d96289a57cb9a  # git rev-parse v${pkgver}
source=(git+https://github.com/${_name}/${_name}.git#commit=${_tag})
sha256sums=('SKIP')

prepare() {
    cd ${_name}
    git checkout ${_tag}
    git submodule update --init --recursive
}

build() {
    cd ${_name}
    make $MAKEFLAGS
}

package() {
    cd ${_name}
    install -D bin/linux-x64-release/src/redisgraph.so ${pkgdir}/usr/lib/redis/redisgraph.so
    install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

