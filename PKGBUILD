# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: mike2208

pkgname=python-ovs
pkgver=3.5.0
pkgrel=1
pkgdesc="Open vSwitch library"
arch=(any)
url="https://github.com/openvswitch/ovs"
license=('Apache-2.0')
depends=(
    'python'
    'python-sortedcontainers'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-netaddr: flow' 
    'python-pyparsing: flow'
    'unbound: dns'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/o/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('7229c2ae11e99d60614c2d5b1f18f7c83ff3ecf0c3424e4eb752acf319425e18bd853904d588f43a7c8d01a05cedc65380891006cbd4c653cde6dda1a621fa46')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
}
