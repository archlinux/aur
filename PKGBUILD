# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-upgradecheck
pkgver=2.4.0
pkgrel=1
pkgdesc="Common code for writing OpenStack upgrade checks"
arch=(any)
url="https://opendev.org/openstack/oslo.upgradecheck"
license=(Apache-2.0)
depends=('python'
         'python-oslo-config'
         'python-oslo-i18n'
         'python-prettytable'
         'python-oslo-utils'
         'python-oslo-policy'
         'python-oslotest'
         'python-yaml'
         'python-fixtures'
         'python-oslo-serialization')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-stestr'
              'pre-commit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('94275dc5241c255461e4d04e01f0fddf1c2f11f34dd3e5e8ea404d52704843a39d0cca7845851abf7260f26c0a6d9f03d0a6ba80da0eb790524c72d32f15f678')

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
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
