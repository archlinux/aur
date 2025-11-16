# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-tooz
pkgver=7.0.0
pkgrel=2
pkgdesc="Coordinate distributed systems"
arch=(any)
url="https://opendev.org/openstack/tooz"
license=('Apache-2.0')
depends=(
    'python'
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
    'python-zake'
    'python-debtcollector'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'git'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('bc23620f600bd17859a1f3815414453e909648b30aaec4595cbf3c8cf868551f6a503d8e81d5edbb161fbcbf7c105fbcd03155a7479c26428baf7104372d0386')

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
