# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-sushy
pkgver=5.8.0
pkgrel=1
pkgdesc="Small Python library to communicate with Redfish based systems"
arch=(any)
url="https://opendev.org/openstack/sushy"
license=('Apache-2.0')
depends=(
    'python'
    'python-pbr'
    'python-requests'
    'python-dateutil'
    'python-stevedore'
    'python-urllib3'
    'python-oslotest'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-coverage'
    'python-stestr'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('772c27fe871db8f551b6c0cb274028e9bc289df6a5ec73baec73eca6df4211a4e03a84aa22ce6ce79df0442bec5d914e0178ef4f52a5828a92dd7b5d4214db34')

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver" || exit
    stestr run
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
