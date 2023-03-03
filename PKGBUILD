# Maintainer: Markus Richter <mqus at disroot dot org>
pkgname=python-pyemd-git
pkgver=r383.255824f
pkgrel=1
pkgdesc="Fast EMD for Python: a wrapper for Pele and Werman's C++ implementation of the Earth Mover's Distance metric "
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/wmayner/pyemd"
license=('MIT')
groups=()
depends=('python' 'python-oldest-supported-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	( set -o pipefail
	    #git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python -m build --wheel --no-isolation
}

#check() {
#	cd "$srcdir/${pkgname%-git}"
#	#pytest
#	PYTHONPATH=./src py.test --cov pyemd test
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
