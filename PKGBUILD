pkgname=sqlite-utils
pkgver=4.0
pkgrel=1
pkgdesc="CLI tool and Python utility functions for manipulating SQLite databases"
arch=("any")
url="https://sqlite-utils.datasette.io/"
license=("Apache-2.0")
depends=("python-sqlite-fts4" "python-click>=8.3.1" "python-click-default-group>=1.2.3" "python-tabulate" "python-dateutil" "python-pluggy" "python-pip")
makedepends=("python-build" "python-installer" "python-setuptools")
checkdepends=("python-pytest" "python-hypothesis")
conflicts=("sqlite-utils")
source=("https://pypi.io/packages/source/${pkgname::1}/${pkgname}/sqlite_utils-${pkgver}.tar.gz")
sha256sums=('cea711807c2bbc18829ed642ae19a23a80e853f4136c4d2a28078a6117ad9426')

build() {
	cd "sqlite_utils-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "sqlite_utils-${pkgver}"
	pytest
}

package() {
	cd "sqlite_utils-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
