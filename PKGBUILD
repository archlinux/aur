# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-cache
pkgver=3.12.0
pkgrel=2
pkgdesc="An oslo.config enabled dogpile.cache"
arch=(any)
url="https://opendev.org/openstack/oslo.cache"
license=('Apache-2.0')
depends=(
    'python'
    'python-pbr'
    'python-dogpile.cache'
    'python-oslo-config'
    'python-oslo-i18n'
    'python-oslo-log'
    'python-oslo-utils'
    'python-pymongo'
    'python-eventlet'
    'python-memcached'
    'python-oslotest'
    'python-testtools'
    'python-oslo-serialization'
    'python-pymemcache'
    'python-binary-memcached'
    'python-etcd3gw'
    'python-debtcollector'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
    'python-sphinxcontrib-apidoc'
)
checkdepends=(
    'python-oslotest'
    'python-pifpaf'
    'python-stestr'
    'python-pymemcache'
    'python-binary-memcached'
    'python-memcached'
    'python-pymongo'
    'python-etcd3gw'
    'redis'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('6f5cd4cb3f05774830ae5728675a5131cc0d03f47597d2a9c9625e43fa16a79a14dc4b7335c2a529c75d28127c51e26c488564600e19e81ce416eed51cf7123d')

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver" || exit
    stestr run
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
