# Maintainer: Zosoled

pkgname='python-ledgered'
_name=${pkgname#python-}
pkgver=0.14.0
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
	'750fd369b36d75e3ecc1b0755450e5189d98e5636d6a8a851f7b5aca5c4d39da'
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

