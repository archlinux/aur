# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-masakariclient
pkgver=8.4.0
pkgrel=1
pkgdesc="Python client for Masakari REST API"
arch=(any)
url="https://opendev.org/openstack/python-masakariclient"
license=('Apache-2.0')
depends=('python'
         'python-openstacksdk'
         'python-osc-lib'
         'python-oslo-i18n'
         'python-oslo-serialization'
         'python-pbr'
         'python-ddt'
         'python-oslotest'
         'python-oslo-utils')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-coverage'
              'python-subunit'
              'python-requests-mock'
              'python-stestr'
              'python-testscenarios'
              'python-testtools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('62d0f5a6ceadd6769433485d5da3715a22f036fb1817740aa43f0ce89989a1574e6f9dca49ec9f5929f5c4a5dd2b850306811da67889899717708b0e285151f4')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"
    stestr run
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
