# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-picorv32
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
_vexriscv=1.0.1
pkgver=2020.08
pkgrel=1
pkgdesc='Python module containing verilog files for picorv32 cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('8220974a9c8f0f4d2e7c78f9eb91f76dc74067fd8b557a8d1500ffd94a0d24ca25e3b68353bd27075943c1626214946b99197477fb3af0e5024e7ea8f70a9dc8')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/tests/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
