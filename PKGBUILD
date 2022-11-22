# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=python-caldav
_name=${pkgname#python-}
pkgver=0.11.0
pkgrel=1
pkgdesc="A CalDAV (RFC4791) client library for Python"
arch=('any')
url="https://github.com/python-caldav/caldav"
license=('Apache' 'GPL3')
depends=('python' 'python-icalendar' 'python-lxml' 'python-requests' 'python-six'
         'python-tzlocal' 'python-vobject')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-recurring-ical-events' 'radicale' 'xandikos')
source=("${_name}-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3df1b27939059cf68a933c76d6d455c11d047dc19f14d4556688e36d05515a89')

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
