# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-ghlang
_pypiname=ghlang
pkgver=2.5.1
pkgrel=1
pkgdesc="Visualize your GitHub language stats, blazingly fast."
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
sha256sums=('95920d9cbae4c5f9f74d7819a2e9df7ae755c01c288d1e3c7a81b2fa3a763ee5')

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
