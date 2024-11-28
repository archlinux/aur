# Maintainer: Vekhir <vekhir at yahoo dot com>

pkgname=python-sorpo-git
pkgver=r65.38776db
pkgrel=1
pkgdesc="Library to find, create and check PKGBUILD updates (main branch)"
arch=('any')
url="https://codeberg.org/Vekhir/python-sorpo"
license=('EUPL-1.2+')
provides=(python-sorpo)
conflicts=(python-sorpo)
depends=('pyalpm' 'python' 'python-gitpython' 'python-networkx' 'python-srcinfo' )
makedepends=('git' 'python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname::git+https://codeberg.org/Vekhir/python-sorpo")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
