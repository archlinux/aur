# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-extras
pkgver=1.0.0
pkgrel=10
pkgdesc="Useful extra bits for Python 3.8 - things that should be in the standard library"
arch=('any')
license=('MIT')
url="https://github.com/testing-cabal/extras"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-testtools')
source=("https://github.com/testing-cabal/extras/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('db264cf183dd0f63a411d03def51bb6ec8c5d47fe1e3e75cab4d65f2793b9458023a2387574968b095bf39cf7746428f7e7f190100dbdf2d99695f4c69875475')

build() {
  cd extras-$pkgver
  python3.8 setup.py build
}

check() {
  cd extras-$pkgver
  python3.8 -m testtools.run extras.tests.test_suite
}

package() {
  cd extras-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
