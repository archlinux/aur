# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: mike2208

pkgname=python-ovs
pkgver=3.3.1
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
b2sums=('0f658b37cb2fcdc13ce6f4b06dea7ee6cffc9537ef08d70d2eb5b61b74891d7bce19b05929dc58a93acfa5fce8ad75e4566225374885db3a48eb29f1ffbd513a')

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
