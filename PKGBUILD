# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=python-constraint
pkgname=$_pkgname-git
pkgver=1.4.0.r4.ge23fe98
pkgrel=1
pkgdesc="Solvers for Constraint Satisfaction Problems (CSPs) over finite domains in simple and pure Python"
arch=(any)
url="https://github.com/python-constraint/python-constraint"
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
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

	python setup.py build
}

check() {
	cd "$_pkgname"

	touch tests/__init__.py
	pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
