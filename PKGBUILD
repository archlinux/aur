# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-os-ken
pkgver=2.9.0
pkgrel=2
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
b2sums=('d452cf3277873c8a318e5d5ff81fd87be863f784773206f5dca8ffe4eb2d1cd724a723c264bcc79d209b061d7b9708d77a0dab450cd75aedd9f461dde9aad7b3')

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
