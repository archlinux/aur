# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pythondata-software-compiler_rt
_pyname=${_pkgname//-/_}
pkgname=python-$_pkgname
pkgver=2022.08
pkgrel=1
pkgdesc='Python module containing data files for compiler_rt software (for use with LiteX)'
arch=('any')
url='https://github.com/litex-hub/pythondata-software-compiler_rt'
license=('MIT' 'custom')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a1dc7d41ada9a9eb3cc9adb3d940b11d6401fcbd7343c5dbc6ccd56d0e084e451003c121c870d3b831c69fcb1fa8224df8983991da42edabf07a62a3982ed7bc')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 $_pyname/data/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
