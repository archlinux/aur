# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-service
pkgver=3.5.0
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
         'python-yappi'
         'python-pbr'
         'python-oslotest'
         'python-eventlet'
         'python-requests'
         'python-fixtures'
         'python-testtools')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-fixtures'
              'python-oslotest'
              'python-requests'
              'python-stestr'
              'python-coverage'
              'procps-ng'
              'python-requests'
              'python-fixtures'
              'python-testtools'
              'python-paste')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('2d0ffc47d263b0ce9b9f18443a78714107634862472b6fadd89578340c929d181a8093b404a5caedc32b8a3d2df64e3e89499370b825fdf01e93c05fe80ec893')

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
