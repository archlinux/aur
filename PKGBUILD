# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-versionedobjects
pkgver=3.8.0
pkgrel=1
pkgdesc="OpenStack versioned objects library"
arch=(any)
url="https://opendev.org/openstack/oslo.versionedobjects"
license=(Apache-2.0)
depends=(
    'python'
    'python-oslo-concurrency'
    'python-oslo-config'
    'python-oslo-context'
    'python-oslo-messaging'
    'python-oslo-serialization'
    'python-oslo-utils'
    'python-oslo-log'
    'python-oslo-i18n'
    'python-webob'
    'python-netaddr'
    'python-jsonschema'
    'python-fixtures'
    'python-testtools'
    'python-eventlet'
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
    'python-hacking'
    'python-oslotest'
    'python-coverage'
    'python-stestr'
    'bandit'
    'python-pre-commit'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('ab78d66ae2fe3adb50b684cc4aa577f7b3484c9f7494f59cdae2d4e976cdc55d3961e6b56dd00a876aa115a6e0c76b6dbf6c4ab9a149f2be39d9720f30cfc582')

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
