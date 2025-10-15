# Maintainer: Phillip Davies <philliptdavies at gmail dot com>
pkgname=pros-cli
pkgver=3.5.6
pkgrel=1
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('any')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
depends=('python'
         'python-click'
         'python-rich-click'
         'python-pyserial'
         'python-cachetools'
         'python-requests'
         'python-requests-futures'
         'python-tabulate'
         'python-jsonpickle'
         'python-semantic-version'
         'python-colorama'
         'python-pyzmq'
         'python-cobs'
         'clang'
         'python-sentry_sdk'
         'python-pypng'
         'python-installer'
         'arm-none-eabi-newlib'
         'arm-none-eabi-gcc')

makedepends=('python-build'
             'python-installer')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f9095e68ceea4ca783c425ecb90da7a58f2870797e190997365ebd4f14f0986c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
