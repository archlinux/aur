# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-ghlang
_pypiname=ghlang
pkgver=2.5.0
pkgrel=2
pkgdesc="Generate pretty charts showing language statistics from GitHub repos or local code using Python"
arch=(any)
url="https://github.com/velox-sh/ghlang"
license=(MIT)
depends=(
	python
	python-requests
	python-matplotlib
	python-pillow
	python-yaml
	python-rich
	python-typer
	python-bdfparser
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
sha256sums=('fa84069f109c505b3a94a70efb81cd4ac5ad4ff33e4b8fbb69e277cee03e040f')

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
