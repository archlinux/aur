# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-neutron-lib
pkgver=3.22.0
pkgrel=1
pkgdesc="Neutron shared routines and utilities"
arch=(any)
url="https://opendev.org/openstack/neutron-lib"
license=(Apache-2.0)
depends=(
    'python'
    'python-pbr'
    'python-sqlalchemy1.4'
    'python-pecan'
    'python-keystoneauth1'
    'python-netaddr'
    'python-stevedore'
    'python-os-ken'
    'python-oslo-concurrency'
    'python-oslo-config'
    'python-oslo-context'
    'python-oslo-db'
    'python-oslo-i18n'
    'python-oslo-log'
    'python-oslo-messaging'
    'python-oslo-policy'
    'python-oslo-serialization'
    'python-oslo-service'
    'python-oslo-utils'
    'python-oslo-versionedobjects'
    'python-osprofiler'
    'python-setproctitle'
    'python-webob'
    'python-os-traits'
    'python-fixtures'
    'python-oslotest'
    'python-requests'
    'python-hacking'
    'python-testtools'
    'python-debtcollector'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
)
checkdepends=(
    'bandit'
    'python-coverage'
    'python-flake8-import-order'
    'python-pylint'
    'python-isort'
    'python-subunit'
    'python-stestr'
    'python-testresources'
    'python-testscenarios'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('0c96f770aa879eba7017279d8dc5e6dde3b515e2d1b2f2afeab62d69cb8d40dd5eb7090a2f5e8382b8813f41d71066b33831f692e6bc44ed939b8199d08be90c')

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

#check(){
#    cd "$pkgname-$pkgver" || exit
#    stestr run
#}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
