# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk
pkgname=doxypypy-git
pkgver=r121.2a89e6a
pkgrel=1
pkgdesc="A more Pythonic version of doxypy, a Doxygen filter for Python."
arch=(any)
url="https://github.com/Feneric/doxypypy"
license=('GPL')
depends=("python" "doxygen")
makedepends=("git" "python-setuptools")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("doxypypy::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1
}
