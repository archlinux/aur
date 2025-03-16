# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-castellan
pkgver=5.2.1
pkgrel=1
pkgdesc="Generic Key Manager interface for OpenStack"
arch=(any)
url="https://opendev.org/openstack/castellan"
license=(Apache-2.0)
depends=(
    'python'
    'python-pbr'
    'python-cryptography'
    'python-barbicanclient'
    'python-oslo-config'
    'python-oslo-context'
    'python-oslo-i18n'
    'python-oslo-log'
    'python-oslo-utils'
    'python-stevedore'
    'python-keystoneauth1'
    'python-requests'
    'python-requests-mock'
    'python-oslotest'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'tar'
)
checkdepends=(
    'python-coverage'
    'python-subunit'
    'python-stestr'
    'python-fixtures'
    'python-testscenarios'
    'pifpaf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('bd6534cc0ab882fa0321e1a3f2cd8487c6fb1819a4a15d443a72c673eb5fa5da3f8f30c43596d4f0d894bedcf4f16d8fe47f09531a0645e3c5c9315a3f02dc4d')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
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
