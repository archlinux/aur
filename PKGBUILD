# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-ovsdbapp
pkgver=2.11.0
pkgrel=1
pkgdesc="OVSDB application library"
arch=(any)
url="https://opendev.org/openstack/ovsdbapp"
license=(Apache-2.0)
depends=(
    'python'
    'python-fixtures'
    'python-netaddr'
    'python-ovs'
    'python-pbr'
    'python-eventlet'
    'python-testscenarios'
    'python-testtools'
    'python-sortedcontainers'
    'python-oslotest'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'tar'
)
checkdepends=(
    'python-coverage'
    'python-isort'
    'python-subunit'
    'python-stestr'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('d0c4ee831b11350bc05d1873e87accd252b78b08e19120c0cc6c3f9d897c11740229c23049e276fa2aad18e3a7caa977ae0b73ad39fc6995e22184acd93a3e07')

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
