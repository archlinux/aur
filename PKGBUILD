# Maintainer: Markus Richter <mqus at disroot dot org>
pkgname=python-saxpy-git
pkgver=r184.92a378a
pkgrel=1
pkgdesc="Symbolic Aggregate approXimation, HOT-SAX, and SAX-VSM implementation in Python"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/seninp/saxpy"
license=('GPL2')
groups=()
depends=('python' 'python-numpy')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('python-saxpy::git+https://github.com/seninp/saxpy.git')
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
    python setup.py build
}

check() {
	cd "$srcdir/${pkgname%-git}"
	PYTHONPATH=. py.test --cov saxpy tests
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
