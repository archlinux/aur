# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-castellan
pkgver=5.1.0
pkgrel=1
pkgdesc="Generic Key Manager interface for OpenStack"
arch=(any)
url="https://opendev.org/openstack/castellan"
license=(Apache-2.0)
depends=('python'
         'python-pbr'
         'python-cryptography'
         'python-barbicanclient'
         'python-oslo-config'
         'python-oslo-context'
         'python-oslo-i18n'
         'python-oslo-log'
         'python-oslo-utils'
         'python-stevedore'
         'python-keystoneauth1'
         'python-requests'
         'python-requests-mock'
         'python-oslotest'
         'python-testtools')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-coverage'
              'python-subunit'
              'python-stestr'
              'python-fixtures'
              'python-testscenarios'
              'pifpaf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('0a5548c2c78131150d6f4712a0c265f2f1ecaabd0ea5769eeebbda8181ae426adf27f8165bd33ff73a71aa56511a5ed6ecf9bdf28381afa0e23ce8f4ad8d7c46')

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
