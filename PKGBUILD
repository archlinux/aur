# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-sushy-tools
pkgver=2.1.0
pkgrel=1
pkgdesc="A set of tools to support the development and test of the Sushy library"
arch=(any)
url="https://opendev.org/openstack/sushy-tools"
license=('Apache-2.0')
depends=(
    'python'
    'python-flask'
    'python-requests'
    'python-tenacity'
    'libvirt-python'
    'python-munch'
    'python-werkzeug'
    'python-oslotest'
    'python-openstacksdk'
    'python-bcrypt'
    'python-webob'
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
    'python-testtools'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('653f6e7ee13b4795282ebfe093fafe7adbf65d6ecad69288be59cae08d5a4ca4f179af0e8ddca73d734941c940b6bd4d9f2038cf34bbe429a60ff1b7479206b5')

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
