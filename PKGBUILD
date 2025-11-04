# Maintainer: Zosoled

pkgname='python-ledgered'
_name=${pkgname#python-}
pkgver=0.12.1
pkgrel=1
pkgdesc='Python tools, utils, libraries, to be used with Ledger cryptodevices'
arch=('any')
url='https://github.com/LedgerHQ/ledgered'
license=('MIT')
depends=(
	'python>=3.9'
	'python-pydantic'
	'python-pyelftools'
	'python-pygithub'
	'python-tomli'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools>=65'
	'python-setuptools-scm>=6.2'
	'python-wheel'
)
optdepends=(
	'python-pytest: Run tests'
	'python-pytest-cov: Code coverage'
)
source=(
	"${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
	'34d0022b6373e5f478722bb2ebc044a5f8af3e3d77831b494f3da7e16471f9d1'
)

build() {
	cd ${_name}-${pkgver}
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${_name}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

