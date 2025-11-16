# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-service
pkgver=4.4.0
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
    'python-futurist'
    'python-cotyledon'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
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
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('9caa5ad1264364a86098391704e223f61b6e4408da5966c2e313d92656aa19fe880654803f05497678aa0929cca41beaa2dbccb7b52067316b8f352b7382adb6')

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
