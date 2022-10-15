# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-picorv32
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
pkgver=2022.08
pkgrel=1
pkgdesc='Python module containing verilog files for picorv32 cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('113e11513bc9d12cc9c58b7a421ebe37b4a73ad182e2ea26e1018973ecce0880313322a8bdc2b954d06954526ce5249463fa477c25cfc97003ae4ef695f4de89')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/tests/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
