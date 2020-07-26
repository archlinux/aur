# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-expiringdict
pkgver=1.2.1
pkgrel=1
pkgdesc='Dictionary with auto-expiring values for caching purposes'
arch=(any)
url=https://github.com/mailgun/expiringdict
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-nose python-mock python-coverage)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('21c6c91cfe427e8f14b0b67fadca2fe27b430daee0a40135fe8a610d5539c672440c8eafc4e325f866fb6b01d12643b1110a19381b85cfebf1dcdb29edc444d7')

build() {
  cd expiringdict-$pkgver
  python setup.py build
}

check() {
  cd expiringdict-$pkgver
  nosetests --with-coverage --cover-package=expiringdict || warning "Tests failed"
}

package() {
  cd expiringdict-$pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
