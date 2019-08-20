# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-expiringdict
pkgver=1.1.4
pkgrel=4
pkgdesc='Dictionary with auto-expiring values for caching purposes'
arch=(any)
url=https://github.com/mailgun/expiringdict
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-nose python-mock python-coverage)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('7fbd4d002122ff5c83dd0845a52febeddddaaf9f51c6ccdcfa208e2c40e3595e3ca352ee50a3b7ef617be14f2d7909d83e728ba728d423c1b31fa1d45465a117')

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
