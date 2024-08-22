# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-ironic-lib
pkgver=6.2.0
pkgrel=1
pkgdesc="A common library to be used exclusively by projects under the Ironic governance."
arch=(any)
url="https://opendev.org/openstack/ironic-lib"
license=('Apache-2.0')
depends=('python'
         'python-oslo-concurrency'
         'python-oslo-config'
         'python-oslo-i18n'
         'python-oslo-utils'
         'python-zeroconf'
         'python-bcrypt'
         'python-webob'
         'python-tenacity'
         'python-keystonemiddleware'
         'python-oslo-messaging'
         'python-keystoneauth1'
         'python-os-service-types'
         'python-oslo-service'
         'python-oslotest'
         'python-fixtures'
         'python-setuptools')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'tar')
checkdepends=('python-coverage'
              'python-stestr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('5274dedebedaaf0dc607da3926862b46d5793735f96ecd58c59802d7b4315e43fc10471702e6348dc0655e895bc40cb989e3ba1e2b463043346f9a088cde2bb9')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"
    stestr run
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 TESTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    mv "$pkgdir/usr/etc" "$pkgdir/etc/"
}
