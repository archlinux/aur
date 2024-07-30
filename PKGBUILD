# Maintainer: Nicolás Celedón-Hernández <coriollis.nch at gmail dot com>

pkgname=ford
pkgver=7.0.8
pkgrel=1
pkgdesc='Automatically generates FORtran Documentation from comments within the code'
arch=(any)
url='https://github.com/Fortran-FOSS-Programmers/ford'
license=('GPL-3.0-only')
depends=('python-toposort' 'python-markdown' 'python-markdown-include' 'python-markdown-math' \
'python-tqdm' 'python-bs4' 'python-graphviz' 'python-pygments' 'python-jinja' \
'python-importlib-metadata' 'python-tomli' 'python-rich' 'python-pcpp')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
optdepends=('fortls: Fortran Language Server compatible with FORD documentation' 'python-sphinx' \
'python-sphinx-autodoc-typehints' 'python-sphinx-inline-tabs' 'python-sphinx-book-theme' \
'sphinx-argparse-cli')
source=("https://pypi.io/packages/source/f/${pkgname}/${pkgname}-${pkgver}.tar.gz" \
'pyproject.toml.patch')
sha256sums=('b9d0695eac1779f73078776e11f5e6c7dbf22e5c9e3dff4a5e7fbe92a0740562'
            '2621c5d2dbab965d7024a367150a637ef8148a7c40666b7b4678c6052fb51596')

prepare() {
	patch "$pkgname-$pkgver"/pyproject.toml pyproject.toml.patch
}

build() {
	cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

	# License
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
