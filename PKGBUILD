# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=python-flexparser
pkgver=0.3.1
pkgrel=1
pkgdesc="A parser by hgrecco"
arch=(any)
url="https://github.com/hgrecco/flexparser"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions' 'python-pytest7')
makedepends=('python-wheel' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-ruff'
	     'git')
checkdepends=('python-pytest-mpl' 'python-pytest-cov' 'python-pytest-subtests')
source=("$pkgname::git+$url.git#tag=${pkgver}")
sha256sums=('e3de6665dc91aba4d9657b86824f884a1069ae7e6c00796b2c8a6f09806b6029')

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
