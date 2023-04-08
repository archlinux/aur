# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pynamecheap
pkgver=0.0.3
pkgrel=9
pkgdesc="Namecheap API client in Python"
url="https://github.com/Bemmu/PyNamecheap"
license=('MIT')
arch=('any')
depends=('python-requests')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bemmu/PyNamecheap/archive/v$pkgver.tar.gz")
sha512sums=('9de6f09c76a85a67269465cb1e270f5533fa84983a220ba855b04d03924e2308b9267f212cc2e4811e7e4fb3542e1c1194a74e4ed7ffd253704d7a394d5e1bb2')

build() {
  cd PyNamecheap-$pkgver
  python setup.py build
}

check() {
  # Needs an account

  cd PyNamecheap-$pkgver
  python setup.py nosetests || echo "Tests failed"
}

package() {
  cd PyNamecheap-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
