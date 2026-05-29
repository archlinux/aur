# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: Alex Hirzel <alex at hirzel period us>

pkgname=python-lightning-utilities
_pkgname=lightning_utilities
pkgver=0.15.3
pkgrel=1
pkgdesc="Common Python utilities and GitHub Actions in Lightning Ecosystem"
arch=('any')
url='https://github.com/Lightning-AI/utilities'
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
	'python-requests: documentation retrieval helpers (lightning_utilities.docs)'
	'python-jsonargparse: command-line interface utilities (lightning_utilities.cli)'
	'python-tomlkit: command-line interface utilities (lightning_utilities.cli)'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e5c9ec533381f27b02faa3bd777dbc95de92477c43b69549f84ee898f7fe10e855ae5619dd21dbb154250dfb8eae27c8b9fd565e7ed3307f02acc0376313d815')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
