# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-msmart-ng
_reponame=midea-msmart
pkgver=2025.12.0
pkgrel=1
pkgdesc="Client for interacting with Help Scout's API"
url="https://github.com/mill1000/midea-msmart"
arch=('any')
license=('MIT')
depends=('python' 'python-httpx' 'python-pycryptodome')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mill1000/midea-msmart/archive/${pkgver}.tar.gz")
sha256sums=('de5d3a7f54c5c28dd69e27f937376fa898260d85b07928121f10232f00c68ea9')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	SETUPTOOLS_SCM_PRETEND_VERSION_FOR_MSMART_NG=${pkgver} python -m build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
