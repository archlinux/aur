# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-cache
pkgver=3.9.0
pkgrel=1
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
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'tar'
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('fbfb4a04e8f110f4c8cc35f40e3adf41de54ddd9c32f2d838ae3268391d59800aa4de94d2b7b9341a56b73ff38f22af009a0eaf6db8e7c5d6d436ca73a97d854')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

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
