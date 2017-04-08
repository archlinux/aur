# Maintainer: LinArcX <Linarcx at gmail . com>

pkgname=python-pytvmaze
pkgver=r401.16ed096
pkgrel=1
pkgdesc="Python interface to the TV Maze API "
arch=(any)
url="http://pypi.python.org/pypi/pytvmaze"
license=(MIT)
depends=('python' 'python-requests')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git+https://github.com/srob650/pytvmaze")
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
  python setup.py install --root="$pkgdir/" --optimize=1
}
