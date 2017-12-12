# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=xandikos
pkgver=0.0.6
pkgrel=1
pkgdesc='CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://www.xandikos.org/
license=('GPL3')
depends=('python-defusedxml' 'python-dulwich' 'python-icalendar' 'python-jinja')
makedepends=('python-setuptools')
source=("xandikos-$pkgver.tar.gz::https://www.jelmer.uk/code/xandikos/tarball/v$pkgver")
sha512sums=('fd7d930283114c7dcee32ce4e4c3031bb09ec3a50ad0cb93da01269fafcf9d3ed96d7e24b0ba820a1b74e7cc03b656d6265827451e6178ea5b2cf291b7acb5b3')

build() {
  python setup.py build
}

check() {
  python -m unittest xandikos.tests.test_suite
}

package() {
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 xandikos.1 "$pkgdir"/usr/share/man/man1/xandikos.1
}

# vim:set ts=2 sw=2 et:
