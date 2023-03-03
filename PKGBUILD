# Maintainer: Markus Richter <mqus at disroot dot org>
pkgname=python-stringdist-git
pkgver=r6.38d0435
pkgrel=1
pkgdesc="String distance measures"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/obulkin/string-dist"
license=('MIT')
groups=()
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('python-stringdist::git+https://github.com/obulkin/string-dist')
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
	PYTHONPATH=. py.test --cov stringdist test_stringdist
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
