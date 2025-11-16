# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-upgradecheck
pkgver=2.6.0
pkgrel=1
pkgdesc="Common code for writing OpenStack upgrade checks"
arch=(any)
url="https://opendev.org/openstack/oslo.upgradecheck"
license=(Apache-2.0)
depends=(
    'python'
    'python-oslo-config'
    'python-oslo-i18n'
    'python-prettytable'
    'python-oslo-utils'
    'python-oslo-policy'
    'python-oslotest'
    'python-yaml'
    'python-fixtures'
    'python-oslo-serialization'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-hacking'
    'python-stestr'
    'pre-commit'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('471ffb19dfd28db0978d93d8fdced973b8f34d0b31db0068f0bea910295c422084286f3bd4292225a1603cc6bee4c708396823a085b3f2647a948daaf48fa2e6')

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
