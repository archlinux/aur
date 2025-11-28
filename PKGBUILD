# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor: RiverOnVenus <error@zhui.dev>

pkgname=python-terminaltexteffects
_pkgname=terminaltexteffects
pkgver=0.14.1
pkgrel=1
pkgdesc='Visual effects engine applied to text in the terminal. '
url="https://github.com/ChrisBuilds/terminaltexteffects"
arch=('any')
license=('MIT')

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry-core' 'python-hatchling')
depends=('python')

conflicts=('terminaltexteffects')
provides=('tte')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/release-${pkgver}.tar.gz")
b2sums=('34ffb3cf2ae59040ccaf7955e03bbfb739b1588d7df7e51790d2ebb19ac74d8a82c708a1aec73c9878894f73a6423e4470f96feb07de985b636824d5bf65e70d')


build() {
	cd "${_pkgname}-release-${pkgver}" || exit

	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-release-${pkgver}" || exit

	python -m installer --destdir="${pkgdir}" dist/*.whl

	rm -rf "${pkgdir}/usr/bin/terminaltexteffects"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
