# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-policy
pkgver=4.4.0
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
b2sums=('ee601235332f1bf114b2aa7d5ac3a2137dd7d9f8eb17022059d7a9a113f341292b2d271821ecfc38616dd99d9c46053ee7bdc9eb45220002b2794174e201f2cd')

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
