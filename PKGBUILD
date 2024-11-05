# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=python-caldav
_name=${pkgname#python-}
pkgver=1.4.0
pkgrel=1
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
  'python-vobject'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
#checkdepends=(
#  'python-pytest'
#  'python-tzlocal'
#  'radicale'
#  'xandikos'
#)
source=("${_name}-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3c97593530e8c93fb8496bc12fcc37046bdea2ab5e3edf6f9d0da54b955e58f8')

prepare() {
  cd "${_name}-$pkgver"

  # Remove shebangs
  find caldav -name "*.py" | xargs sed -i '1 {/^#!/d}'
}

build() {
  cd "${_name}-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
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
