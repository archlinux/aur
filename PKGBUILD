# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-lm32
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
_vexriscv=1.0.1
pkgver=2020.08
pkgrel=1
pkgdesc='Python module containing verilog files for lm32 cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('custom:Lattice')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a70c73f9d99da4eb6cbcc00717e22eb56a78f42c7e3dd000bd7cc8330877ef2e7ea907282a4848c60c1903fd8d69e823b69118bf9d2a6462d3fac63301b9c703')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/LICENSE.LATTICE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
