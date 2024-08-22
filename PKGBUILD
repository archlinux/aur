# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-os-ken
pkgver=2.10.0
pkgrel=1
pkgdesc="A component-based software defined networking framework for OpenStack"
arch=(any)
url="https://opendev.org/openstack/os-ken"
license=(Apache-2.0)
depends=('python'
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
         'python-setuptools'
         'python-testtools'
         'python-sqlalchemy1.4'
         'mininet')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-coverage'
              'python-subunit'
              'python-oslotest'
              'python-stestr'
              'python-pycodestyle'
              'python-pylint')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('e375cae3883dbd08ac3386e413496f6c0f96ed5b4618ac035946b469e80a8ded1590e3b463a820f84705e884db475ade214bb3be83a324ee6f1d1f0586cde32a')

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
