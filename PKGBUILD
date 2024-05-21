# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-tooz
pkgver=6.2.0
pkgrel=1
pkgdesc="Coordinate distributed systems"
arch=(any)
url="https://opendev.org/openstack/tooz"
license=('Apache-2.0')
depends=('python'
         'python-stevedore'
         'python-voluptuous'
         'python-msgpack'
         'python-fasteners'
         'python-tenacity'
         'python-futurist'
         'python-oslo-utils'
         'python-oslo-serialization'
         'python-testtools'
         'python-pymysql'
         'python-pymemcache'
         'python-sysv_ipc'
         'python-ddt'
         'python-fixtures'
         'python-psycopg2'
         'python-etcd3gw'
         'python-kazoo'
         'python-requests'
         'python-redis'
         'python-zake')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools'
             'tar')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('f90d0fd1bb051b0630514d7af916962005a0f8df3dba9e01f80e79caaabd627338cd62862ad57d8447f2b6450c6e80755650ed0478da0b3b5dc13772ec356c8c')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
