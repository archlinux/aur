pkgname=sqlite-utils
pkgver=3.38
pkgrel=1
pkgdesc="CLI tool and Python utility functions for manipulating SQLite databases"
arch=("any")
url="https://sqlite-utils.datasette.io/"
license=("Apache")
depends=("python-sqlite-fts4" "python-click" "python-click-default-group" "python-tabulate" "python-dateutil" "python-pluggy")
makedepends=("python-build" "python-installer" "python-setuptools")
checkdepends=("python-pytest" "python-hypothesis")
conflicts=("sqlite-utils")
source=("https://pypi.io/packages/source/${pkgname::1}/${pkgname}/sqlite_utils-${pkgver}.tar.gz")
sha256sums=("1ae77b931384052205a15478d429464f6c67a3ac3b4eafd3c674ac900f623aab")

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
