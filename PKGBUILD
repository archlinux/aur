# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-ghlang
_pypiname=ghlang
pkgver=2.5.5
pkgrel=1
pkgdesc="Generate pretty charts for your GitHub language stats."
arch=(any)
url="https://github.com/velox-sh/ghlang"
license=(MIT)
depends=(
	python
	python-matplotlib
	python-pillow
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
sha256sums=('cc13d61510a720836d649aa891df5e241fc861728a1cd8538c06400b6307a816')

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
