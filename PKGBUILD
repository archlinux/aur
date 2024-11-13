# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-policy
pkgver=4.5.0
pkgrel=1
pkgdesc="Rules engine to enforce access control policy"
arch=(any)
url="https://opendev.org/openstack/oslo.policy"
license=(Apache-2.0)
depends=('python'
         'python-requests'
         'python-oslo-config'
         'python-oslo-context'
         'python-oslo-i18n'
         'python-oslo-serialization'
         'python-yaml'
         'python-stevedore'
         'python-oslo-utils'
         'python-fixtures'
         'python-requests-mock'
         'python-testtools'
         'python-oslotest'
         'python-pbr'
         'python-sphinx'
         'python-docutils')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-stestr'
              'python-coverage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('c0759467eb12589b25ed0f67e2232a2765521e746831f3be169a4d20f192d45ffd34d05545d52ae19b13444e804a12d2db1db515a68d20ebd8629e4e2dbb7b7d')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"
    stestr run
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
