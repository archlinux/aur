# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=xandikos
pkgver=0.0.9
pkgrel=1
pkgdesc='Lightweight yet complete CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://www.xandikos.org/
license=('GPL3')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/x/xandikos/xandikos-$pkgver.tar.gz")
sha512sums=('940e92cda8dd92da578c29b9f35924ff3443e23b034afe673c68f1595c9e443c4736758c3896965ac334f5295360f7dea4248aa7a8b187248f8fc5707ba45611')

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
