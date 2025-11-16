# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-masakariclient
pkgver=8.7.0
pkgrel=1
pkgdesc="Python client for Masakari REST API"
arch=(any)
url="https://opendev.org/openstack/python-masakariclient"
license=('Apache-2.0')
depends=(
    'python'
    'python-openstacksdk'
    'python-osc-lib'
    'python-oslo-i18n'
    'python-oslo-serialization'
    'python-pbr'
    'python-ddt'
    'python-oslotest'
    'python-oslo-utils'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-hacking'
    'python-coverage'
    'python-subunit'
    'python-requests-mock'
    'python-stestr'
    'python-testscenarios'
    'python-testtools'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('084697809f408700820d69f6fb0a9ca8ec1223fce909375a5b30cd94ab433e01f3c41cac19233e474f1ce713b7f0cfce2ab4076b5858eb614c0f1eb71bab86c2')

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
