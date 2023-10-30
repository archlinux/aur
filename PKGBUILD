# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=redis-bloom
_name=RedisBloom
pkgver=2.6.8
pkgrel=1
pkgdesc="Probabilistic Datatypes Module for Redis "
arch=('x86_64')
url="https://redis.io/docs/stack/bloom/"
license=("custom:SSPL1")
makedepends=('git' 'cmake')
depends=('redis')
_tag=ffd011f6fc870c21284ff939023149229ed23a71  # git rev-parse v${pkgver}
source=(git+https://github.com/${_name}/${_name}.git#commit=${_tag})
sha256sums=('SKIP')

prepare() {
    cd ${_name}
    git checkout ${_tag}
    git submodule update --init --recursive
}

build() {
    cd ${_name}
    make build
}

package() {
    cd ${_name}
    install -D bin/linux-x64-release/redisbloom.so ${pkgdir}/usr/lib/redis/redisbloom.so
    install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

