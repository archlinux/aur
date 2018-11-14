# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=xandikos
pkgver=0.0.11
pkgrel=1
pkgdesc='Lightweight yet complete CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://www.xandikos.org/
license=('GPL3')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/x/xandikos/xandikos-$pkgver.tar.gz")
sha512sums=('52eb3d064690a3ca8bb99c90325485102600905def933939b5a79716409b7706fb8a8c977adaa59200ab6fb49ff2ba68fc1dab5f05bf43add7f72eaa9a18f40b')

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
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 xandikos.1
}

# vim:set ts=2 sw=2 et:
