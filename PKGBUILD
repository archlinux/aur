# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-keystonemiddleware
pkgver=10.12.0
pkgrel=1
pkgdesc="Middleware for the OpenStack Identity API (Keystone)"
arch=(any)
url="https://opendev.org/openstack/keystonemiddleware"
license=('Apache-2.0')
depends=(
    'python'
    'python-keystoneauth1'
    'python-oslo-cache'
    'python-oslo-config'
    'python-oslo-context'
    'python-oslo-i18n'
    'python-oslo-log'
    'python-oslo-serialization'
    'python-oslo-utils'
    'python-pbr'
    'python-pycadf'
    'python-pyjwt'
    'python-keystoneclient'
    'python-requests'
    'python-webob'
    'python-requests-mock'
    'python-cryptography'
    'python-testresources'
    'python-oslo-messaging'
    'python-webtest'
    'python-stevedore'
    'python-memcached'
    'python-testtools'
    'python-fixtures'
    'python-oslotest'
    'python-binary-memcached'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-sphinx'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-hacking'
    'python-flake8-docstrings'
    'python-coverage'
    'python-cryptography'
    'python-fixtures'
    'python-oslotest'
    'python-requests-mock'
    'python-stevedore'
    'python-stestr'
    'python-testresources'
    'python-testtools'
    'python-webtest'
    'python-memcached'
    'python-oslo-messaging'
    'python-pyjwt'
    'bandit'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('4e49179b334bbb372a0877e551c7d15fed7a8748b2b6fc19aeb3fa8baabc40d8afec648529270580496c37242e749e441ac7a48c3efa04f24380297697cb9b4a')

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
