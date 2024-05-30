# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-ovsdbapp
pkgver=2.8.0
pkgrel=1
pkgdesc="OVSDB application library"
arch=(any)
url="https://opendev.org/openstack/ovsdbapp"
license=(Apache-2.0)
depends=('python'
         'python-fixtures'
         'python-netaddr'
         'python-ovs'
         'python-pbr'
         'python-eventlet'
         'python-testscenarios'
         'python-testtools'
         'python-sortedcontainers'
         'python-oslotest')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-coverage'
              'python-isort'
              'python-subunit'
              'python-stestr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('7524f69f605898c9e9eb85a43331d3ee315794e89bc1a13cbcc90336f31902e08e78633736fb75d94309944d65b02925c96950ebdb80572d6e6ed942fe0a2234')

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
    install -Dm644 TESTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
