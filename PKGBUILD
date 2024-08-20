# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: mike2208

pkgname=python-ovs
pkgver=3.4.0
pkgrel=1
pkgdesc="Open vSwitch library"
arch=(any)
url="https://github.com/openvswitch/ovs"
license=('Apache-2.0')
depends=('python'
         'python-sortedcontainers')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('python-netaddr: flow' 
            'python-pyparsing: flow'
            'unbound: dns')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/o/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
b2sums=('068d47eca0d7ba688f4cfa3fac44092e541af6f0f5417d029c4b9d47434ff25fcf9f52928fe5c564095d12480e22776fd0c197da3378af5863d0051bd68c58a4')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
}
