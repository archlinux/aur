# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=redis-bloom
_name=RedisBloom
pkgver=2.4.5
pkgrel=1
pkgdesc="Probabilistic Datatypes Module for Redis "
arch=('x86_64')
url="https://redis.io/docs/stack/bloom/"
license=("custom:SSPL1")
makedepends=('git' 'cmake')
depends=('redis')
_tag=b2b3fe13fb383cd2249186c17cd1add80548dc04  # git rev-parse v${pkgver}
source=(git+https://github.com/${_name}/${_name}.git)
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

