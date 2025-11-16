# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-metrics
pkgver=0.13.0
pkgrel=1
pkgdesc="OpenStack library for collecting metrics from Oslo libraries"
arch=(any)
url="https://opendev.org/openstack/oslo.metrics"
license=(Apache-2.0)
depends=(
    'python'
    'python-oslo-utils'
    'python-oslo-log'
    'python-oslo-config'
    'python-prometheus_client'
    'python-oslotest'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
)
checkdepends=(
    'python-hacking'
    'python-oslotest'
    'bandit'
    'python-coverage'
    'python-stestr'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('dd7aa384af35e23a2050756ed8cb627ed940ac92ab6d96ea3852779b97934ebbfa7678ada9c3e8c14ebf86f3d6f71c9e1f8754b52bd15d054e0b36be16e8d52d')

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
