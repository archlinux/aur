# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-os-traits
pkgver=3.5.0
pkgrel=1
pkgdesc="A library containing standardized trait strings. Used by placement service and clients to ensure consistency"
arch=(any)
url="https://opendev.org/openstack/os-traits"
license=(Apache-2.0)
depends=(
    'python'
    'python-pbr'
    'python-oslotest'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-sphinx'
    'python-setuptools'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-hacking'
    'python-coverage'
    'python-stestr'
    'python-testscenarios'
    'python-testtools'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('f509b80d4ad7836756b6b315a847b2ee85d22654eeab30c1e954850af0dff51a3c54ad2112d533a36c9bd994594aa79e1c40363b10b408f66aaf119c749ab868')

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
