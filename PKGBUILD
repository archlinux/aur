# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-ironic-lib
pkgver=7.0.0
pkgrel=1
pkgdesc="A common library to be used exclusively by projects under the Ironic governance."
arch=(any)
url="https://opendev.org/openstack/ironic-lib"
license=('Apache-2.0')
depends=(
    'python'
    'python-oslo-concurrency'
    'python-oslo-config'
    'python-oslo-i18n'
    'python-oslo-utils'
    'python-zeroconf'
    'python-bcrypt'
    'python-webob'
    'python-keystonemiddleware'
    'python-oslo-messaging'
    'python-keystoneauth1'
    'python-os-service-types'
    'python-oslo-service'
    'python-oslotest'
    'python-fixtures'
    'python-setuptools'
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
b2sums=('14a23aa27631a7110e8bb4ec6c29f4c5c908e495b609e5dcae7e3974784091419a3d9b351dbd1cf3d174e3b92132a9ce9386d77989e419f375a82f566f0c220b')

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
    mv "$pkgdir/usr/etc" "$pkgdir/etc/"
}
