# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: mike2208

pkgname=python-ovs
pkgver=3.6.1
pkgrel=1
pkgdesc="Open vSwitch library"
arch=(any)
url="https://github.com/openvswitch/ovs"
license=('Apache-2.0')
depends=(
    'python'
    'python-sortedcontainers'
    'python-rich'
    'python-click'
    'python-graphviz'
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
b2sums=('f0ae343333ad6b1f9f396dc0539363966db8619d9646525d9f4628161564801ad35fe4f95ed1d0e9e19a84772e2190441339ecfc4fa07d693dfef4860f95600f')

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
