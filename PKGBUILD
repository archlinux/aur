# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-cache
pkgver=3.7.0
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
b2sums=('58f77ac2ff3736072592b4a65c87388e42cf593329c4eaa5e64d4e6d86854ad968ec3765a8d6f4b85a50fb80b6c3e5e9b7206fde9a93610f99dcefb5547a38a4')

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
