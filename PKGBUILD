# Maintainer: Zosoled

pkgname='python-ragger'
_name=${pkgname#python-}
pkgver=1.40.2
pkgrel=1
pkgdesc='Small wrapper around Speculos, LedgerWallet & LedgerComm to ease instrumentation'
arch=('any')
url='https://github.com/LedgerHQ/ragger'
license=('Apache-2.0')
depends=(
	'python>=3.9'
	'python-bip_utils'
	'python-ledgered'
	'python-mnemonic'
	'python-py-sr25519-bindings'
	'python-toml'
	'qemu-user-static'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools>=75'
	'python-setuptools-scm>=6.2'
	'python-wheel'
)
optdepends=(
	'python-graphviz: Generate dependency diagrams from documentation'
)
source=(
	"${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
	'bea60f4534ff40fa64ec07120e743dc2141be6eaa33db4826a75ec245e7fc24e'
)

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
