# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=python-cohost
pkgver=0.4.1
pkgrel=2
pkgdesc="A python library for Cohost.org!"
arch=('any')
url="https://github.com/valknight/Cohost.py"
license=('MIT')
depends=('python>3.6' 'python-requests')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/release/${pkgver}.tar.gz")
noextract=()
sha256sums=('35a24088bafd847f956e8c04e6a1df684744ad969ca747bb66d4f9e793b4049d')

build() {
	cd "Cohost.py-release-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "Cohost.py-release-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
