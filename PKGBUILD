# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>
# Contributor: Riccardo Berto <riccardobrt at gmail dot com>

pkgname=redis-graph
_name=RedisGraph
pkgver=2.10.10
pkgrel=1
pkgdesc="A graph database as a Redis module"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://redis.io/docs/stack/graph/"
license=("custom:SSPL1")
makedepends=('git' 'cmake' 'peg')
depends=('redis')
conflicts=('redis-graph-git')
_tag=aaf1fc9cd54a3890745422ea63109b1c0c5c1d7e # git rev-parse v${pkgver}
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

