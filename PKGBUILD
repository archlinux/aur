# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=python-caldav
_name=${pkgname#python-}
pkgver=1.2.1
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
sha256sums=('4a11d91e3861a0ca80997cd325900ea94a3875d869143e9ea2b051f446b11eb0')

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
