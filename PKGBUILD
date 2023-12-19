# Maintainer: jlaunay
pkgname=ical2orgpy-git
_appname=ical2orgpy
_gitname=ical2org.py
pkgver=0.3.r38.gb2224f4
pkgrel=1
pkgdesc='This script converts an ical calendar (for instance, as exported from google calendar) into an org-mode document.'
url='https://github.com/ical2org-py/ical2org.py.git'
arch=('any')
license=('GPL3')
depends=('python-tzlocal' 'python-pytz' 'python-icalendar' 'python-recurring-ical-events' 'python-future' 'python-click')
source=("git+${url}")
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
md5sums=('SKIP')

build() {
    cd ${srcdir}/${_gitname}
    python -m build --wheel --no-isolation
}

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_gitname}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
