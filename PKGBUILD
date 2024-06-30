# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=python-flexcache
pkgver=0.3
pkgrel=1
pkgdesc="A robust and extensible package to cache on disk the result of expensive calculations."
arch=(any)
url="https://github.com/hgrecco/flexcache"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions' 'python-pytest7')
makedepends=('python-wheel' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-ruff'
	     'git')
checkdepends=('python-pytest-mpl' 'python-pytest-cov' 'python-pytest-subtests')
source=("$pkgname::git+$url.git#tag=${pkgver}")
sha256sums=('8b23a2959b94c77870ca93ff310ae9f21c1d1aec358a518e9c210b88dd51d960')

prepare() {
	cd "$srcdir/$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$pkgname"
	pytest
}

package() {
	cd "$srcdir/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
