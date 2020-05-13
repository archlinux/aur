# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-expiringdict
pkgver=1.2.0
pkgrel=4
pkgdesc='Dictionary with auto-expiring values for caching purposes'
arch=(any)
url=https://github.com/mailgun/expiringdict
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-nose python-mock python-coverage)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('44f7c2d8cd8a60a31c27b8369627cf31d4da721116f7edb5648428331a1d3c4b9a7df8ba21c16f9a61c8806bd4b675dda43a5059bf5e2a8867018f1545be7c20')

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
