# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-middleware
pkgver=6.3.1
pkgrel=1
pkgdesc="OpenStack middleware library"
arch=(any)
url="https://opendev.org/openstack/oslo.middleware"
license=('Apache-2.0')
depends=(
    'python'
    'python-pbr'
    'python-jinja'
    'python-oslo-config'
    'python-oslo-context'
    'python-oslo-i18n'
    'python-oslo-utils'
    'python-stevedore'
    'python-webob'
    'python-debtcollector'
    'python-statsd'
    'python-bcrypt'
    'python-greenlet'
    'python-oslotest'
    'python-testtools'
    'python-fixtures'
    'python-oslo-serialization'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-sphinx'
    'python-setuptools'
    'python-wheel'
    'tar'
)
checkdepends=(
    'python-fixtures'
    'python-oslotest'
    'python-testtools'
    'python-coverage'
    'python-oslo-serialization'
    'python-stestr'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('fa714d5e98ab341facafb5c3f9866bff8dd6c9aa387b890f991579a8f264daec98e9ecbc6f2913d03ce12d6aa3d4eae4ffe113e4b49cfe5467d0d18118c514b5')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver" || exit
    stestr run
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
