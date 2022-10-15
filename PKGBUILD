# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-vexriscv
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
_vexriscv=1.0.1
pkgver=2022.08
pkgrel=1
pkgdesc='Python module containing verilog files for vexriscv cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "VexRiscv-$_vexriscv.tar.gz::https://github.com/SpinalHDL/VexRiscv/archive/$_vexriscv.tar.gz")
sha512sums=('1d748d237658109f54d03b945e1e7696c8117b2d460fe96989e5612d2eb0035ef1ce6b3dde4b0d914359c92bb7d2b41d139d708b7c40994abdea2b78e41b8dbd'
            '830b18faf8fb54eb443c9704f0e28da546231f7be52df5b59e4eb27a341eb4e947ec982782eee6c1d5103b4e582c7ffbab62ab5a77c465c32f3f4cd716b6136e')

prepare() {
  cd $_pkgname-$pkgver

  rmdir $_pyname/verilog/ext/VexRiscv
  ln -sf "$srcdir"/VexRiscv-$_vexriscv $_pyname/verilog/ext/VexRiscv
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/ext/VexRiscv/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
