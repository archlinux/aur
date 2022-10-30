# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=python-caldav
pkgver=0.10
pkgrel=1
pkgdesc="A CalDAV (RFC4791) client library for Python"
arch=('any')
url="https://github.com/python-caldav/caldav"
license=('Apache' 'GPL3')
depends=('python' 'python-lxml' 'python-requests' 'python-six' 'python-vobject')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-icalendar' 'python-nose' 'python-pytest' 'python-tzlocal')
optdepends=('python-icalendar' 'python-tzlocal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('23684644ec07e778956e27e454cf9c5fce89484ffec6312767969c20a1a3cdde')

build() {
  cd "caldav-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "caldav-$pkgver"
  pytest
}

package() {
  cd "caldav-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
