# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-vexriscv
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
_vexriscv=1.0.1
pkgver=2020.08
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
sha512sums=('245a675bef2594b5fecf61f0c184c2241906def1b97a2bf5495b6f6c32ea7660fb81d4b3ebabdac1822b54cb6e2efc977f1da2bbcf2f475e605064ffc1050251'
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
