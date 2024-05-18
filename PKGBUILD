# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-inventree-part-import-git
pkgver=r192.f206e5c
pkgrel=1
pkgdesc="CLI to import parts from into your InvenTree instance"
url="https://github.com/30350n/inventree_part_import"
depends=(
    'python-beautifulsoup4'
    'python-click'
    'python-cutie'
    'python-digikey-api'
    'python-fake-useragent'
    'python-inventree'
    'python-isocodes'
    'python-platformdirs'
    'python-requests'
    'python-tablib'
    'python-thefuzz'
    'python-yaml'
)
makedepends=(python-build python-installer python-wheel python-poetry)
license=('MIT')
arch=('any')
source=("$pkgname::git+https://github.com/30350n/inventree_part_import.git")
sha256sums=('SKIP')
conflicts=('python-inventree-part-import')
provides=("python-inventree-part-import=${pkgver}")

pkgver() {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
