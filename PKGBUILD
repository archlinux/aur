# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-sushy
pkgver=5.3.0
pkgrel=1
pkgdesc="Small Python library to communicate with Redfish based systems"
arch=(any)
url="https://opendev.org/openstack/sushy"
license=('Apache-2.0')
depends=('python'
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
b2sums=('13a487f268cbd34ccff3fd28c797a6e7b9e5b1c46a73f5fab0994b60c3a133523ab0f51322c8904b685c189478a0718f3fe98afe70945fcb354c3162bc4fe796')

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
