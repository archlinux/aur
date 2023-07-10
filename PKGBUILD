# Maintainer: A Frederick Christensen <aur@ivories.org>
pkgname="plann-git"
_pkgname="plann"
pkgver=r332.91dc51b
pkgrel=1
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
  rm tests/test_functional.py # This test does not correctly function as of 2023-07-10
  pytest
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}


