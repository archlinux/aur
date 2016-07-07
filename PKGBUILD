# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>
pkgname=python-plotly-git
pkgver=r2079.a1c0a9c
pkgrel=1
pkgdesc="an interactive, browser-based charting library for python"
arch=('any')
url="https://plot.ly/python/"
license=('MIT')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('python' 'python-requests' 'python-pytz')
source=('python-plotly::git+https://github.com/plotly/plotly.py.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python3 setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# vim:set sw=2 et:
