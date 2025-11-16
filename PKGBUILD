# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-os-ken
pkgver=4.0.0
pkgrel=1
pkgdesc="A component-based software defined networking framework for OpenStack"
arch=(any)
url="https://opendev.org/openstack/os-ken"
license=(Apache-2.0)
depends=(
    'python'
    'python-pbr'
    'python-eventlet'
    'python-msgpack'
    'python-ncclient'
    'python-netaddr'
    'python-oslo-config'
    'python-ovs'
    'python-packaging'
    'python-paramiko'
    'python-lxml'
    'python-greenlet'
    'python-testscenarios'
    'python-testtools'
    'python-sqlalchemy1.4'
    'mininet'
    'python-setuptools'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-hacking'
    'python-coverage'
    'python-subunit'
    'python-oslotest'
    'python-stestr'
    'python-pycodestyle'
    'python-pylint'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('efa41b5e5533214c77285c25cce54bc04603308ffcdcb73f806ee8e5a174c04129f66b1dfd5077352ce787cd1f893f973a5abd0096845e8b52b4abf01f35a0f2')

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
