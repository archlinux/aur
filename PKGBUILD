# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=flit-git
pkgver=4.0.0.r0.gef7f319
pkgrel=1
pkgdesc='Simple packaging tool for simple Python packages.'
arch=('any')
url="http://flit.readthedocs.io"
license=('BSD')
provides=('flit')
conflicts=('python-flit')
depends=('python' 'python-docutils' 'python-flit-core' 'python-requests' 'python-tomli-w')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/pypa/flit.git")
sha256sums=('SKIP')

pkgver() {
	cd flit
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd flit
  python -m build --wheel --no-isolation
}

package() {
  cd flit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
