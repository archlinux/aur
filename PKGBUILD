# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-metrics
pkgver=0.11.0
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
    'tar'
)
checkdepends=(
    'python-hacking'
    'python-oslotest'
    'bandit'
    'python-coverage'
    'python-stestr'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('d0c0ddd918b7658ec51371fd1f8286ef2e6e547935266ec370aeb95c90a74a844cfb2c5ab40af4490c7c70476854048969a6e240b46b2afa5d3b4cb8f6dc75ea')

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
