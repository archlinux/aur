# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-rootwrap
pkgver=7.2.0
pkgrel=1
pkgdesc="OpenStack library for rootwrap"
arch=(any)
url="https://opendev.org/openstack/oslo.rootwrap"
license=(Apache-2.0)
depends=('python'
         'python-pbr'
         'python-eventlet'
         'python-fixtures'
         'python-testtools')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-stestr'
              'python-oslotest'
              'bandit'
              'pre-commit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('83d0e5e6799ca9b1b0f5000581792a31f4260ebd5355ba92164c99321f1ca1d86bdc515f00b6f289208f31913f84632ccf7fda0ba8ec094b29f750937e170187')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

#check(){
#    cd "$pkgname-$pkgver"
#    stestr run
#}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
