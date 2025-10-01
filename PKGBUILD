# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-msmart-ng
_reponame=midea-msmart
pkgver=2025.9.2
pkgrel=1
pkgdesc="Client for interacting with Help Scout's API"
url="https://github.com/mill1000/midea-msmart"
arch=('any')
license=('MIT')
depends=('python' 'python-httpx' 'python-pycryptodome')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mill1000/midea-msmart/archive/${pkgver}.tar.gz")
sha256sums=('5a7f2a7aa93480696c9acfe8c5dca0f30009c7d8733ceb0991d0d9c2d75797d5')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	SETUPTOOLS_SCM_PRETEND_VERSION_FOR_MSMART_NG=${pkgver} python -m build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
