# Maintainer: A Frederick Christensen <aur@ivories.org>
pkgname="plann-git"
_pkgname="plann"
pkgver=r356.b04fd62
pkgrel=2
pkgdesc="plann is a caldav client for calendar and task management"
url="https://github.com/tobixen/plann"
arch=('any')
license=('GPL')
depends=('python'
	 'python-caldav>=0.12.0'
	 'python-click'
	 'python-icalendar'
	 'python-pytz'
	 'python-tzlocal'
	 'python-six'
	 'python-sortedcontainers'
 	 'python-vobject'
	 'python-yaml')
makedepends=('python-build'
	     'python-installer'
	     'python-pytest'
	     'python-setuptools'
	     'python-wheel'
	     'xandikos')
conflicts=('plann')
source=("${pkgname}::git+https://github.com/tobixen/${_pkgname}/")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  pytest
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


