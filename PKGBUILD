# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-expiringdict
pkgver=1.2.2
pkgrel=1
pkgdesc='Dictionary with auto-expiring values for caching purposes'
arch=(any)
url=https://github.com/mailgun/expiringdict
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-nose python-mock python-coverage python-dill)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('5465cf193c4c5f5ebf72c58e3ee82e994f20bdd5d34ba6ead2a43544c4ab66a542ab47c87fbd653927f23b042e4c079fd3a60ba3edeebcdc9cf83813bb127c24')

build() {
  cd expiringdict-$pkgver
  python setup.py build
}

check() {
  cd expiringdict-$pkgver
  nosetests --with-coverage --cover-package=expiringdict
}

package() {
  cd expiringdict-$pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
