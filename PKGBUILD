# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=python-caldav
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="A CalDAV (RFC4791) client library for Python"
arch=('any')
url="https://github.com/python-caldav/caldav"
license=('Apache' 'GPL3')
depends=('python-icalendar' 'python-lxml' 'python-recurring-ical-events'
         'python-requests' 'python-six' 'python-tzlocal' 'python-vobject')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-cov' 'radicale' 'xandikos')
source=("${_name}-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f1aea9f04eb35af21276cfc458db522d06395166cf245b21c7e0fdd50507c727')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-$pkgver"
  pytest
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
