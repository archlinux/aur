# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=python-constraint
pkgname=$_pkgname-git
pkgver=2.0.0b3.r10.g2357471
pkgrel=1
pkgdesc="Solvers for Constraint Satisfaction Problems (CSPs) over finite domains in simple and pure Python"
arch=(any)
url="https://github.com/python-constraint/python-constraint"
license=('BSD')
depends=('python' 'cython')
makedepends=('git' 'python-setuptools' 'python-poetry' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pep440')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "$_pkgname"

	# There's a build.py file in the root, so `python -m build` will run that instead!
	pyproject-build --wheel --no-isolation
}

check() {
	cd "$_pkgname"

	pytest --no-cov
}

package() {
	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
