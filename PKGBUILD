# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-service
pkgver=3.4.0
pkgrel=1
pkgdesc="Library for running OpenStack services"
arch=(any)
url="https://opendev.org/openstack/oslo.service"
license=('Apache-2.0')
depends=('python'
         'python-webob'
         'python-debtcollector'
         'python-eventlet'
         'python-greenlet'
         'python-oslo-utils'
         'python-oslo-concurrency'
         'python-oslo-config'
         'python-oslo-log'
         'python-oslo-i18n'
         'python-pastedeploy'
         'python-routes'
         'python-paste'
         'python-yappi')
makedepends=('python-build'
             'python-installer'
             'python-sphinx'
             'python-setuptools'
             'python-wheel')
checkdepends=('python-fixtures'
              'python-oslotest'
              'python-requests'
              'python-stestr'
              'python-coverage'
              'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('0581b6a62fa5a72a0a4c59f9a07d41f01393bd687be550c0da0948097e0813cdda75abc5266c2cb443722e6665f57edaac85692574fd4afe648922c3d7ef139e')

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
