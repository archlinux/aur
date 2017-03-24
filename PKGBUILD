# Maintainer: LinArcX <LinArcX at gmail dot com>

pkgname=tvdoon-git
pkgver=r3.69640c1
pkgrel=1
pkgdesc="Show Information About Tv Show's, Ratings And So Many Cool Fatures!"
arch=('any')
url="https://github.com/LinArcX/tvdoon"
license=('GPL3')
depends=('python' 'python-prettytable' 'python-pyfiglet' ' python-tvdb_api-git')
makedepends=('git' 'python-setuptools')
provides=("${pkgname}" 'python-requests-cache')
conflicts=("${pkgname}" 'python-requests-cache')
source=("${pkgname}::git+https://github.com/LinArcX/tvdoon")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
		( set -o pipefail
			git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
		)
}

package() { 
	cd "${srcdir}/${pkgname}"
	python setup.py install --prefix=/usr --root="$pkgdir"
}
