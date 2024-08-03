# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-neutron-lib
pkgver=3.14.0
pkgrel=1
pkgdesc="Neutron shared routines and utilities"
arch=(any)
url="https://opendev.org/openstack/neutron-lib"
license=(Apache-2.0)
depends=('python'
         'python-pbr'
         'python-sqlalchemy'
         'python-pecan'
         'python-keystoneauth1'
         'python-netaddr'
         'python-stevedore'
         'python-os-ken'
         'python-oslo-concurrency'
         'python-oslo-config'
         'python-oslo-context'
         'python-oslo-db'
         'python-oslo-i18n'
         'python-oslo-log'
         'python-oslo-messaging'
         'python-oslo-policy'
         'python-oslo-serialization'
         'python-oslo-service'
         'python-oslo-utils'
         'python-oslo-versionedobjects'
         'python-osprofiler'
         'python-setproctitle'
         'python-webob'
         'python-os-traits'
         'python-ddt'
         'python-fixtures'
         'python-oslotest'
         'python-requests'
         'python-hacking'
         'python-testtools')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('bandit'
              'python-coverage'
              'python-flake8-import-order'
              'python-pylint'
              'python-isort'
              'python-subunit'
              'python-stestr'
              'python-testresources'
              'python-testscenarios')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('fe0caf7685d0a7bb48c2ad3b66494a2cd5c73719ce4caeac5fea0ba81629d90685a7ebed68cfdd13f188e97890b74aeded06df2e048f6177a54a7a3a7b62ce57')

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
