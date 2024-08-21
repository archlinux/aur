# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-privsep
pkgver=3.4.0
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
b2sums=('94da5cc6cd868e6b6c0ff7105f7f79abb428e82ef19a9b5662a62bb90d50f228df64c9af7aec6ae102f6d22e7ed2d246a6fefce35c49d31fd20d661f42b58efc')

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
