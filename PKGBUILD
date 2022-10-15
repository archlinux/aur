# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-lm32
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
pkgver=2022.08
pkgrel=1
pkgdesc='Python module containing verilog files for lm32 cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('custom:Lattice')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('8fcb56bc71f349b283ac62e15bf3186de1a71d7e31cd8cc1f37edad5b1cd62d21fe65083d392507e0913971f91e69e4680800aa8ec196a1e887da59b60b1b7ef')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/LICENSE.LATTICE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
