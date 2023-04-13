# Maintainer: Bao Trinh <qubidt@gmail.com>

_pkgname=python-cohost
pkgname=${_pkgname}-git
pkgver=0.2.5.r2.ga4aacd1
pkgrel=1
pkgdesc="A python library for Cohost.org!"
arch=('any')
url="https://github.com/valknight/Cohost.py"
license=('BSD')
depends=('python>3.6' 'python-requests')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/valknight/cohost.py.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	# add missing commit
	git tag -f 'release/0.2.5' f0d0c7838301bd03823196c3ba2d2dee726ed2d5
	git describe --long --tags | sed 's|^release/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
