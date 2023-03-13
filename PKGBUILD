# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>
# Contributor: Riccardo Berto <riccardobrt at gmail dot com>

pkgname=redis-graph
_name=RedisGraph
pkgver=2.10.9
pkgrel=1
pkgdesc="A graph database as a Redis module"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://redis.io/docs/stack/graph/"
license=("custom:SSPL1")
makedepends=('git' 'peg')
depends=('redis' 'cmake')
conflicts=('redis-graph-git')
_tag=684918cc14df9a645fb40802cea07af07d49035e # git rev-parse v${pkgver}
source=(git+https://github.com/${_name}/${_name}.git)
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
    install -D src/redisgraph.so ${pkgdir}/usr/lib/redis/redisgraph.so
    install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

