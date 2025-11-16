# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-rootwrap
pkgver=7.8.0
pkgrel=1
pkgdesc="OpenStack library for rootwrap"
arch=(any)
url="https://opendev.org/openstack/oslo.rootwrap"
license=(Apache-2.0)
depends=(
    'python'
    'python-pbr'
    'python-eventlet'
    'python-fixtures'
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
    'python-hacking'
    'python-stestr'
    'python-oslotest'
    'bandit'
    'pre-commit'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('63adb2963c75efaf58f503132219671564e250fe1be05b6b13567edd0e0b00f8e38f74869ac5cacbc4e3c34d7abc36179828edd858cc490587b895bf335a92b9')

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
