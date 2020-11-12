# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-lm32
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
_vexriscv=1.0.1
pkgver=2020.04
pkgrel=3
pkgdesc='Python module containing verilog files for lm32 cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('custom:Lattice')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e37da7c510485160f9686867a301ea182145ce1d6c3f53c4b69fa47ccf040c8bf6696012672d1237a469280010f1f11d73eb5dbe1d6a0adf6318d6c98fc93e69')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/LICENSE.LATTICE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
