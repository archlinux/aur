# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=python-caldav
_name=${pkgname#python-}
pkgver=1.3.9
pkgrel=2
pkgdesc="A CalDAV (RFC4791) client library for Python"
arch=('any')
url="https://github.com/python-caldav/caldav"
license=('Apache-2.0 AND GPL-3.0-or-later')
depends=(
  'python-icalendar'
  'python-lxml'
  'python-recurring-ical-events'
  'python-requests'
  'python-six'
  'python-tzlocal'
  'python-vobject'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
#checkdepends=(
#  'python-pytest-cov'
#  'radicale'
#  'xandikos'
#)
source=("${_name}-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b733fb9e038e1addf725ad3bb8ec8725d6f4f401cc7203ef01936faa618f5409')

prepare() {
  cd "${_name}-$pkgver"

  # Remove shebangs
  find caldav -name "*.py" | xargs sed -i '1 {/^#!/d}'
}

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "${_name}-$pkgver"
#  python -m venv --clear --system-site-packages .testenv
#  .testenv/bin/python -m installer dist/*.whl
#  .testenv/bin/python -m pytest
#}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
