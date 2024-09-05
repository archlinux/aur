# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-masakariclient
pkgver=8.5.0
pkgrel=1
pkgdesc="Python client for Masakari REST API"
arch=(any)
url="https://opendev.org/openstack/python-masakariclient"
license=('Apache-2.0')
depends=('python'
         'python-openstacksdk'
         'python-osc-lib'
         'python-oslo-i18n'
         'python-oslo-serialization'
         'python-pbr'
         'python-ddt'
         'python-oslotest'
         'python-oslo-utils')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-coverage'
              'python-subunit'
              'python-requests-mock'
              'python-stestr'
              'python-testscenarios'
              'python-testtools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('57f3172344fc34fcf55887820da5ec6192ed3487d3ee00877407b7f1e80516c7cec3385498178cfc623dfdfc621df1bb258cfedefb5d71bb96b564d3ad69c2b4')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION="$pkgver" python -m build --wheel --no-isolation
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
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
