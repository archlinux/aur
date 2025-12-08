# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-msmart-ng
_reponame=midea-msmart
pkgver=2025.11.0
pkgrel=1
pkgdesc="Client for interacting with Help Scout's API"
url="https://github.com/mill1000/midea-msmart"
arch=('any')
license=('MIT')
depends=('python' 'python-httpx' 'python-pycryptodome')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mill1000/midea-msmart/archive/${pkgver}.tar.gz")
sha256sums=('1d174a8553afe3671cb8e46694b842bb9c7a3e2b6b91c2f5f374dacd2383f728')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	SETUPTOOLS_SCM_PRETEND_VERSION_FOR_MSMART_NG=${pkgver} python -m build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
