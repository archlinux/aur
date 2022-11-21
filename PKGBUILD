# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-deprecated
pkgver=1.2.13
pkgrel=3
pkgdesc="Python @deprecated decorator to deprecate old python classes, functions or methods"
url="https://github.com/tantale/deprecated"
license=('MIT')
arch=('any')
depends=('python38-wrapt')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tantale/deprecated/archive/v$pkgver.tar.gz")
sha512sums=('c170b086bc4e37462181a0f53edbe745aa4f4924c7fd64d9693de267e070392b74445f9cba935e85c878b755603ca6cada8b4130ac96ab071be284047aa35619')

build() {
  cd deprecated-$pkgver
  python3.8 setup.py build
}

check() {
  cd deprecated-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd deprecated-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname/
}
