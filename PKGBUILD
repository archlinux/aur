# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=xandikos
pkgver=0.0.6
pkgrel=1
pkgdesc='Lightweight yet complete CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://www.xandikos.org/
license=('GPL3')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/x/xandikos/xandikos-$pkgver.tar.gz")
sha512sums=('b0eca599ca724ba8567e3db9833ed589228c413f2bba22fd98cf5217a3eb1942f4c4a3c7d43a9adfa11cb527ed9d526d8fc418aa000b35b443c8842cc416fa97')

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
