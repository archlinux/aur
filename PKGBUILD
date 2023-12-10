# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=python-caldav
_name=${pkgname#python-}
pkgver=1.3.8
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
sha256sums=('f66a53751153db6d6b768c106fca323fc0adfb66b9716a1972d2a7294c99ab2c')

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
