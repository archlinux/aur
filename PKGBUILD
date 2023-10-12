# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-pyleri
pkgver=1.4.2
pkgrel=1
pkgdesc='Left-right parser for SiriDB'
arch=(any)
url=https://github.com/cesbit/pyleri
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=(91c523c1325ac60a9b3477a04f16443bd89b17b5f7dd430c27f96fa5fafd07915482fae60ad08044d0922207ad182b1bf0bb4922f8d533b882fb188a4ec8b4c9)

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
