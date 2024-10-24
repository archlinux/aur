# Maintainer: Quintin Scherrer <quitninscherrer@gmail.com>


pkgname=python-pyrtlsdr-git
_pkg=pyrtlsdr
pkgver=0.3.0
pkgrel=2
pkgdesc='A Python wrapper for librtlsdr'
arch=('any')
url='https://github.com/pyrtlsdr/pyrtlsdr'
license=('GPL3')
depends=('python-setuptools' 'rtl-sdr')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
