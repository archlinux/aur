# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=xandikos
pkgver=0.0.10
pkgrel=1
pkgdesc='Lightweight yet complete CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://www.xandikos.org/
license=('GPL3')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/x/xandikos/xandikos-$pkgver.tar.gz")
sha512sums=('8b081302c691003603c5787ad28107f750e04426939111eff93313b0e8aa4a4c24c23a3b448a9969ae53b7fba1c0fd1509724e60ebb0a84cd14f863cd09e581a')

build() {
  cd xandikos-$pkgver
  python setup.py build
}

check() {
  cd xandikos-$pkgver
  python -m unittest xandikos.tests.test_suite
}

package() {
  cd xandikos-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 xandikos.1 "$pkgdir"/usr/share/man/man1/xandikos.1
}

# vim:set ts=2 sw=2 et:
