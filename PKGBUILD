# Maintainer: Maks Verver <maks@verver.ch>
pkgname=python-reader
_name=reader
pkgver=3.16
pkgrel=1
pkgdesc='Python feed reader library for RSS, Atom, and JSON feeds'
arch=(any)
url='https://github.com/lemon24/reader'
license=('BSD-3-Clause')
depends=(
	python-beautifulsoup4
	python-feedparser
	python-iso8601
	python-requests
	python-typing_extensions
	python-werkzeug
)
makedepends=(
	python-build
	python-installer
	python-wheel
)
optdepends=(
	python-flask
	python-humanize
	python-mutagen
	python-requests-wsgi-adapter
)
checkdepends=(
	${optdepends[@]}
	python-lxml
	python-mechanicalsoup
	python-pytest
	python-pytest-subtests
	python-requests-mock
)
source=(
	"$_name-$pkgver.tar.gz::https://github.com/lemon24/$_name/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('16ba11ec46cdff10adbbcd04bf7b0b1c749ae6461a169a83f637d10740326a29')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	PYTHONPATH=src/ pytest --runslow
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
