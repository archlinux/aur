# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-recurring-ical-events
pkgver=3.1.1
pkgrel=1
pkgdesc="Python library for recurrence of ical events based on icalendar"
arch=('any')
url="https://github.com/niccokunzmann/python-recurring-ical-events"
license=('LGPL-3.0-or-later')
depends=(
  'python-dateutil'
  'python-icalendar'
  'python-tzdata'
  'python-x-wr-timezone'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('49234566066e5ac6a2f4d8d940729a3b21078e382debfd004739c9897fab16b6')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"

  # Debug and check the default time zone
  export TZ="UTC"
  python -c 'import time; time.tzset(); print(time.strftime("%X %x %Z"))'
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
