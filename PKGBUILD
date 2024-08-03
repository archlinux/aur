# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-os-traits
pkgver=3.1.0
pkgrel=1
pkgdesc="A library containing standardized trait strings. Used by placement service and clients to ensure consistency"
arch=(any)
url="https://opendev.org/openstack/os-traits"
license=(Apache-2.0)
depends=('python'
         'python-pbr'
         'python-oslotest')
makedepends=('python-build'
             'python-installer'
             'python-sphinx'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-coverage'
              'python-stestr'
              'python-testscenarios'
              'python-testtools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('cdedbf78cf81a75333c2182cb8463f82adb05a075732bf33b449daf811359a7ced0419668a4f5b4df52f92f6cf86600935cd93077dff5466fcc7005326855bd2')

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
