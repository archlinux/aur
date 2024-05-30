# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-privsep
pkgver=3.3.0
pkgrel=1
pkgdesc="OpenStack library for privilege separation"
arch=(any)
url="https://opendev.org/openstack/oslo.privsep"
license=(Apache-2.0)
depends=('python'
         'python-oslo-log'
         'python-oslo-i18n'
         'python-oslo-config'
         'python-oslo-utils'
         'python-cffi'
         'python-eventlet'
         'python-msgpack'
         'python-fixtures'
         'python-testtools'
         'python-oslotest'
         'python-pbr')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-stestr'
              'bandit'
              'pre-commit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('88cf18e8f7d871d1a285d94830523319b5b80c06758486c037b03df2834a4a4b83bded2035db54ed814b4d4dcfa63fe21d4651a2f5561d91e3081ca50ca344e6')

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
