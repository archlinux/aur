# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-sushy
pkgver=5.2.0
pkgrel=1
pkgdesc="Small Python library to communicate with Redfish based systems"
arch=(any)
url="https://opendev.org/openstack/sushy"
license=('Apache-2.0')
depends=('python'
         'python-setuptools'
         'python-pbr'
         'python-requests'
         'python-dateutil'
         'python-stevedore'
         'python-urllib3'
         'python-oslotest')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'tar')
checkdepends=('python-coverage'
              'python-stestr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('7bfc151d234ec8622c0ccb62c079ea11c65bb98adb1fb05bfaa0557d0b0711051a055d81a2564b03e824bf284ce46cbdd170226a37e6c63edec6880b51d93ce4')

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
