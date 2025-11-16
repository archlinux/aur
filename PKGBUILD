# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-castellan
pkgver=5.4.1
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
    'git'
)
checkdepends=(
    'python-coverage'
    'python-subunit'
    'python-stestr'
    'python-fixtures'
    'python-testscenarios'
    'pifpaf'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('1a551a5b29d74067c9bddb06657c9bf2a08e203fcf42d0b8ae4c35397a663179dae10bf0835c5ad00db257fd4f91a58b9b25cf7991c810f6a3b11677ef408949')

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
