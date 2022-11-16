# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-pyleri
pkgver=1.4.1
pkgrel=1
pkgdesc='Left-right parser for SiriDB'
arch=(any)
url=https://github.com/cesbit/pyleri
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('7f8415789bfa7b8264a5f9fd3e26219dbd2b8e63a5d41768e126bc062f239863054c2379ce71ecf87a28822b736ae131b725e9825275dd38fd2224493780d6dd')

build() {
  cd pyleri-$pkgver
  python setup.py build
}

check() {
  cd pyleri-$pkgver/test
  python -m unittest || warning "Tests failed"
}

package() {
  cd pyleri-$pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  cp -a examples "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
