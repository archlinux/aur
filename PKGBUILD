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
sha512sums=('43572c5dce87fc2ee44b644ad49980409f9eb65cb534035cd9cb12d7be0d17e6e99f97dfefd4d9d67804011968f8ffabebed3713a153f7d83c7ae5ae291e6fd9')

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
