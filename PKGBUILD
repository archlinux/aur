# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-ghlang
_pypiname=ghlang
pkgver=2.4.2
pkgrel=1
pkgdesc="Generate language statistics and visualizations from GitHub repositories or local files"
arch=(any)
url="https://github.com/MihaiStreames/ghlang"
license=(MIT)
depends=(
	python
	python-requests
	python-matplotlib
	python-pillow
	python-yaml
	python-rich
	python-typer
)
makedepends=(
	python-build
	python-hatchling
	python-installer
	python-wheel
)
checkdepends=(
	python-pytest
)
optdepends=(
	'tokount: local directory analysis with ghlang local'
)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-$pkgver.tar.gz")
sha256sums=('1bacb8d7453e7aceca9a7020e21bbd551af1994dea2fef222ca90ec0cfd8a244')

build() {
	cd "$srcdir/$_pypiname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_pypiname-$pkgver"
	pytest
}

package() {
	cd "$srcdir/$_pypiname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
