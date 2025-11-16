# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-ovsdbapp
pkgver=2.13.0
pkgrel=1
pkgdesc="OVSDB application library"
arch=(any)
url="https://opendev.org/openstack/ovsdbapp"
license=(Apache-2.0)
depends=(
    'python'
    'python-fixtures'
    'python-netaddr'
    'python-ovs'
    'python-pbr'
    'python-eventlet'
    'python-testscenarios'
    'python-testtools'
    'python-sortedcontainers'
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
    'python-isort'
    'python-subunit'
    'python-stestr'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('18aa560fcffd7e5bd7f08aff6f181779785ebb72159240936e2d28181feaecdd6f981362d5e2f22cc98081f421975a78ed8960165af8cbefbda144894552c6dc')

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
