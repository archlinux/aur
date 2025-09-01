# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>
# Contributor: Luca Lemmo <luca at linux dot com>

pkgname=flent-git
pkgver=2.2.0.r33.24b86e4f3b20
pkgrel=1
pkgdesc='The FLExible Network Tester.'
arch=('any')
url='https://flent.org'
license=('GPL')
depends=('python' 'netperf')
makedepends=(git python-build python-installer python-wheel)
provides=('flent')
conflicts=('netperf-wrapper' 'flent')
replaces=('netperf-wrapper')
optdepends=(
	'python-matplotlib: for outputting graphs'
	'python-qtpy: for the GUI'
)
source=(git+https://github.com/tohojo/flent.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
        git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
	cd "$srcdir/${pkgname%-git}"

        python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}"

	python -m installer --destdir="$pkgdir" dist/*.whl
}
