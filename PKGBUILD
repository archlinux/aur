# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=snagboot
pkgver=1.0
pkgrel=1
pkgdesc='Generic recovery and reflashing tool for embedded platforms'
arch=(any)
url='https://github.com/bootlin/snagboot'
license=('GPL2')
depends=(dtc # for pylibfdt
         'python>=3.8'
         python-crccheck
         python-hid
         python-pyserial
         python-pyusb
         # 'python-pylibfdt>=1.7.0.post1'
         python-six
         python-tftpy
         python-xmodem
         python-yaml
         swig)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e8c0486b42fb31587ec9401ab4dd678d4649025ba943d2d2c8f59dd8da4dacd91e5b8edaa321a447a7fc44d345d2c4f68fc0d5939c31842302c8cdc7e73f2457')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
