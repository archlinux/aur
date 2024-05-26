# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-sushy
pkgver=5.1.0
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
b2sums=('a34742969013b2698dad9e4de5de7776b924f02b264f44727511b8219b75432ce1d6adb81e287a15a28f3dda84de7d16621f5491898eb3d422606e98cdf69c38')

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
