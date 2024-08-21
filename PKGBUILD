# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-metrics
pkgver=0.9.0
pkgrel=1
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
b2sums=('9db95e6b57027b879f98d99934a8061f7e7e47ec0c2005faa701be8f21ea1a1a7eb7842df4210594204783fbc6cdd9bc4dcf87af60f641ef87e2c71f0214606c')

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
