# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-middleware
pkgver=6.1.0
pkgrel=1
pkgdesc="OpenStack middleware library"
arch=(any)
url="https://opendev.org/openstack/oslo.middleware"
license=('Apache-2.0')
depends=('python'
         'python-pbr'
         'python-jinja'
         'python-oslo-config'
         'python-oslo-context'
         'python-oslo-i18n'
         'python-oslo-utils'
         'python-stevedore'
         'python-webob'
         'python-debtcollector'
         'python-statsd'
         'python-bcrypt')
makedepends=('python-build'
             'python-installer'
             'python-sphinx'
             'python-setuptools'
             'python-wheel')
checkdepends=('python-fixtures'
              'python-oslotest'
              'python-testtools'
              'python-coverage'
              'python-oslo-serialization'
              'python-stestr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('49f8fd07956afb30f12292bac384c58d93b539264638dda0f0a48b983caaa4bdc3c3a0f870027ebf34fc4257d965585bce561693be90d1c7d180b9a7357b74b3')

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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
