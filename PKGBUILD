# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-cpu-mor1kx
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
pkgver=2022.08
pkgrel=1
pkgdesc='Python module containing verilog files for mor1kx cpu (for use with LiteX)'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('custom:OHDL')
depends=('python')
makedepends=('python-setuptools')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ee0fc7a143740fd4d48a2c5dde0adc90958f651956ebda94b39e1a0bbf65863a0777f788b9820c5ed00101593e95ce891634db9ec18e40bd4cb3675cdf84c473')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/verilog/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
