# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-middleware
pkgver=6.6.0
pkgrel=1
pkgdesc="OpenStack middleware library"
arch=(any)
url="https://opendev.org/openstack/oslo.middleware"
license=('Apache-2.0')
depends=(
    'python'
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
    'python-bcrypt'
    'python-greenlet'
    'python-oslotest'
    'python-testtools'
    'python-fixtures'
    'python-oslo-serialization'
    'python-requests'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-sphinx'
    'python-setuptools'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-fixtures'
    'python-oslotest'
    'python-testtools'
    'python-coverage'
    'python-oslo-serialization'
    'python-stestr'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('c71378cb249412c7a7123c23cb36a422ca214827ae2afbc27b0eb00795cbd471c3ee246ef30f1fe7f2730157953c517be6c8884776a9ec79cf3bd7fd641cbf48')

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
