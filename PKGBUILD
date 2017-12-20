# $Id: PKGBUILD 274560 2017-12-16 10:45:58Z arojas $
# Maintainer:
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=python-btchip
pkgname=(python-btchip python2-btchip)
pkgver=0.1.24
pkgrel=2
pkgdesc="Python library to communicate with BTChip dongle"
arch=('any')
makedepends=(python-setuptools python2-setuptools)
optdepends=('btchip-udev: access BTChip as non-root user')
url="https://github.com/LedgerHQ/btchip-python"
license=('Apache')
source=($pkgname-$pkgver.tar.gz::https://github.com/LedgerHQ/btchip-python/archive/v$pkgver.tar.gz)
sha256sums=('2afab0f326b96bd819e8bc9cb69edc7c55773741a50a5e5a36d224bcfd93a4a2')

prepare() {
  cp -r btchip-python-$pkgver btchip-python2-$pkgver
}

build() {
  cd btchip-python-$pkgver
  python setup.py build

  cd ../btchip-python2-$pkgver
  python2 setup.py build
}

package_python-btchip() {
  depends=(python-hidapi)

  cd btchip-python-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-btchip() {
  depends=(python2-hidapi)

  cd btchip-python2-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

