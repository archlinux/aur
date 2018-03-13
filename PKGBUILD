# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=python-btchip
pkgname=('python-btchip' "python2-btchip")
pkgver=0.1.26
pkgrel=1
pkgdesc="Python library to communicate with BTChip dongle"
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
optdepends=('btchip-udev: access BTChip as non-root user')
url="https://github.com/LedgerHQ/btchip-python"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LedgerHQ/btchip-python/archive/v$pkgver.tar.gz")
sha256sums=('482df6d331db3855b48873bc4e82182a25f79e79dee147f90b2b9e7c14eef12a')

prepare() {
  cp -r "btchip-python-$pkgver" "btchip-python2-$pkgver"
}

build() {
  cd "btchip-python-$pkgver"
  python setup.py build

  cd "../btchip-python2-$pkgver"
  python2 setup.py build
}

package_python-btchip() {
  depends=('python-hidapi')

  cd "btchip-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-btchip() {
  depends=('python2-hidapi')

  cd "btchip-python2-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

