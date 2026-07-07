# Maintainer: Nicolás Celedón-Hernández <coriollis.nch at gmail dot com>

pkgname=ford
pkgver=7.0.13
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
source=("https://pypi.io/packages/source/f/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('482a75b34b9f2b1975cbae9aa1c533a62d63e0c1861b5b772d25aa52fb1ce809')

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
