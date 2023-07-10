# Maintainer: A Frederick Christensen <aur@ivories.org>
# Contributor: Tobias Brox <t-arch@tobixen.no>
pkgname="calendar-cli-git"
_pkgname="calendar-cli"
pkgver=r286.2dd2577
pkgrel=1
pkgdesc="calendar-cli is a caldav client for calendar and task management"
url="https://github.com/tobixen/calendar-cli"
arch=('any')
license=('GPL')
provides=('calendar-cli')
conflicts=('calendar-cli')
depends=('python'
	 'python-caldav>=0.11.0'
	 'python-icalendar'
	 'python-pytz'
	 'python-vobject'
	 'python-tzlocal'
	 'python-six')
makedepends=('python-build'
	     'python-installer'
	     'python-pytest'
	     'python-setuptools'
	     'python-wheel')
source=("${pkgname}::git+https://github.com/tobixen/${_pkgname}")
sha256sums=('SKIP')

pkgver(){
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

## The current test_cal.py is not usable since
## plann (and cal.py) was split out from calendar_cli
## For now (calendar_cli commit 2dd2577), tests are disabled

# check() {
#   cd "${pkgname}"
#   pytest
# }

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
