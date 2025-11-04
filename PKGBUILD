# Maintainer: Zosoled

pkgname='python-bip_utils'
_name=${pkgname#python-}
pkgver=2.10.0
pkgrel=1
pkgdesc='Generation of mnemonics, seeds, private/public keys and addresses for different types of cryptocurrencies'
arch=('any')
url='https://github.com/ebellocchia/bip_utils'
license=('MIT')
depends=(
	'python>=3.7'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools>=77'
	'python-setuptools-scm>=6.2'
	'python-wheel'
)
source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
	'SKIP'
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

