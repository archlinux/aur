# Maintainer:
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_name=btchip-python
pkgname=python-btchip
pkgver=0.1.32
pkgrel=3
pkgdesc="Python library to communicate with BTChip dongle"
arch=(any)
url="https://github.com/LedgerHQ/btchip-python"
license=(Apache)
depends=(
  python
  python-ecdsa
  python-hidapi
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'btchip-udev: access BTChip as non-root user'
  'python-pyscard: for smartcard support'
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
  $pkgname-0.1.32-setup.patch
)
sha512sums=('ec9218743fdb71af794bc8e3bf27c3c40bec5b4f90376288e360f4de004eb5acf85a5aaba06ec76c670b4f7e14281b8cc3c3b23f4348de6d65a4b978d7aa8acb'
            'af5144a0cb50c2d92d920d714a81fe81a001fbf723abfa14a67d84b518e3fcde2152fad492dd3b97427c0ae4523b996c4effb33ff0fb6622e991f9352762b6dd')
b2sums=('27971a6efc04836f44837997ecb3f31bb3ff425c0f3cd9a06e2189363f956b42e2867b2e0b9c45dda08e76e68707a915f56adc9b978a2b0afcc2a874fdfd75c9'
        '7506461601bcd98db5ff0da40452479771ad1226ebf5e4ebe28d5d09ee19b99c2d45e1ecec0a14324b5c3735db3a43ee754c3cdc464c97c860011806b9c23be5')

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.1.32-setup.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
