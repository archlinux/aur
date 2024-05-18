# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-metrics
pkgver=0.8.0
pkgrel=2
pkgdesc="OpenStack library for collecting metrics from Oslo libraries"
arch=(any)
url="https://opendev.org/openstack/oslo.metrics"
license=(Apache-2.0)
depends=('python'
         'python-oslo-utils'
         'python-oslo-log'
         'python-oslo-config'
         'python-prometheus_client'
         'python-oslotest')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-oslotest'
              'bandit'
              'python-coverage'
              'python-stestr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('df2d3f679a8675df597d51fffad4d466d45ba0bfd49405358a5b2ce2498f9bfe94ab75813c4120d417b0d34f69e57890c8489bc87b4faa7bdf6447153621a920')

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
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
