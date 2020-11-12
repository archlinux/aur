# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-picorv32
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
_vexriscv=1.0.1
pkgver=2020.04
pkgrel=3
pkgdesc='Python module containing verilog files for picorv32 cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2087236196f9797d4b5746a30634e5d4a535b065c780b85102d7d97b858e30d615d5c2868b61ac8fbb71e671bf2b414eabf2ad6b8a39b34f64f4bde0c907cfb1')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/tests/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
