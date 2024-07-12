# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-cache
pkgver=3.8.0
pkgrel=1
pkgdesc="An oslo.config enabled dogpile.cache"
arch=(any)
url="https://opendev.org/openstack/oslo.cache"
license=('Apache-2.0')
depends=('python'
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
         'python-etcd3gw')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar'
             'python-sphinxcontrib-apidoc')
checkdepends=('python-oslotest'
              'python-pifpaf'
              'python-stestr'
              'python-pymemcache'
              'python-binary-memcached'
              'python-memcached'
              'python-pymongo'
              'python-etcd3gw'
              'redis')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('a83fbe0d622d8236090d85f59574e9fd36986a2a3f8c249690a596d729c814cb6e3e724a8807e87a7108d23e663fce8709c5ff1cfe753b6688e6f7fa38e7172a')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"
    stestr run
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
