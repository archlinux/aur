# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-keystonemiddleware
pkgver=10.7.1
pkgrel=1
pkgdesc="Middleware for the OpenStack Identity API (Keystone)"
arch=(any)
url="https://opendev.org/openstack/keystonemiddleware"
license=('Apache-2.0')
depends=('python'
         'python-keystoneauth1'
         'python-oslo-cache'
         'python-oslo-config'
         'python-oslo-context'
         'python-oslo-i18n'
         'python-oslo-log'
         'python-oslo-serialization'
         'python-oslo-utils'
         'python-pbr'
         'python-pycadf'
         'python-pyjwt'
         'python-keystoneclient'
         'python-requests'
         'python-webob'
         'python-requests-mock'
         'python-cryptography'
         'python-testresources'
         'python-oslo-messaging'
         'python-webtest'
         'python-stevedore'
         'python-memcached'
         'python-testtools'
         'python-fixtures'
         'python-oslotest'
         'python-setuptools')
makedepends=('python-build'
             'python-installer'
             'python-sphinx'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-flake8-docstrings'
              'python-coverage'
              'python-cryptography'
              'python-fixtures'
              'python-oslotest'
              'python-requests-mock'
              'python-stevedore'
              'python-stestr'
              'python-testresources'
              'python-testtools'
              'python-webtest'
              'python-memcached'
              'python-oslo-messaging'
              'python-pyjwt'
              'bandit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('670be2e67b5f850709db1535a323c68ca950beb7bb776cc1977bd9abc0c034b56b4dde864a60e8443244fdc43201b127979d11abdd778c52b05f765d484de2c3')

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
