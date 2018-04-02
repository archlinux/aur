# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=xandikos
pkgver=0.0.7
pkgrel=1
pkgdesc='Lightweight yet complete CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://www.xandikos.org/
license=('GPL3')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/x/xandikos/xandikos-$pkgver.tar.gz")
sha512sums=('2b5e2acedb318b8fd186a1880bf2ba31f588927b0a67b06bd3a75410b753c0776ca58ea1088ee394c0cdb132179d373740abe592a8281bd99ae32995f821cd94')

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
