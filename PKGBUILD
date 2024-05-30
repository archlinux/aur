# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-upgradecheck
pkgver=2.3.0
pkgrel=1
pkgdesc="Common code for writing OpenStack upgrade checks"
arch=(any)
url="https://opendev.org/openstack/oslo.upgradecheck"
license=(Apache-2.0)
depends=('python'
         'python-oslo-config'
         'python-oslo-i18n'
         'python-prettytable'
         'python-oslo-utils'
         'python-oslo-policy'
         'python-oslotest'
         'python-yaml'
         'python-fixtures'
         'python-oslo-serialization')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-stestr'
              'pre-commit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('bb7d79c03626c882f927a6037b19fb51141c27373ca1a35d10ba30ee30c82ba1c9564a3517294d6d947ba441f35026598e3df879c0a4d0559d21a8d57099aadb')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

#check(){
#    cd "$pkgname-$pkgver"
#    stestr run
#}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
