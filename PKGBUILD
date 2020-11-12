# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-mor1kx
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
_vexriscv=1.0.1
pkgver=2020.04
pkgrel=3
pkgdesc='Python module containing verilog files for mor1kx cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('custom:OHDL')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('fc7e4fdba394831bd1dce9a47a33cf91f051b04108af9dca8dc57f1a9221d53c16692ef4117a7cca485fdc9684848e31ca9311be73088b8c1108e25fed6e9df4')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
