# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=python-pyrtlsdr-git
_pkg=pyrtlsdr
pkgver=0.2.93.r0.g7a854dc
pkgrel=1
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
