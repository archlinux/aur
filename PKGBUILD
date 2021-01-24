# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-mor1kx
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
_vexriscv=1.0.1
pkgver=2020.08
pkgrel=1
pkgdesc='Python module containing verilog files for mor1kx cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('custom:OHDL')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cf1e535c974612efa10a142afdf8541adb5107c85a8c11d1c454474a47856c81b34509335fa322ec7ea29a7d0f99a7fdc30248a935fe077a7acb190e345aecd6')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
