# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-service
pkgver=4.1.1
pkgrel=1
pkgdesc="Library for running OpenStack services"
arch=(any)
url="https://opendev.org/openstack/oslo.service"
license=('Apache-2.0')
depends=(
    'python'
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
    'python-testtools'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'tar'
)
checkdepends=(
    'python-fixtures'
    'python-oslotest'
    'python-requests'
    'python-stestr'
    'python-coverage'
    'procps-ng'
    'python-requests'
    'python-fixtures'
    'python-testtools'
    'python-paste'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('eb214a8c3da360b6b6f60bfa121e61473e6a4ecb21cc5cea1d3f008530417cc73257ca1bbe207e9060bba5d1f7116cd51acb566efb10afbfb115df9ae532b020')

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
