# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-masakariclient
pkgver=8.6.0
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
    'tar'
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('b6e7f37b75eaae9d36db74a8836d22685918f29acb3959f3b73ca324be70059c02fda131e85371313f48fd99490950bececd0c902eea39248b45b76e3ab2b35a')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

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
