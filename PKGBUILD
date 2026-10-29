# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-msmart-ng
_reponame=midea-msmart
pkgver=2026.9.0
pkgrel=1
pkgdesc="Client for interacting with Help Scout's API"
url="https://github.com/mill1000/midea-msmart"
arch=('any')
license=('MIT')
depends=(
	'python'
	'python-httpx'
	'python-pycryptodome'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
optdepends=(
	'python-yaml: Dump capabilities to .yaml'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mill1000/midea-msmart/archive/${pkgver}.tar.gz")
sha256sums=('58939b40811e2f9d58874e7f9cc865c8c831821dc0241f2f0c4a4268c5b22ca8')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	SETUPTOOLS_SCM_PRETEND_VERSION_FOR_MSMART_NG=${pkgver} python -m build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
