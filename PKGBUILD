# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor: RiverOnVenus <error@zhui.dev>

pkgname=python-terminaltexteffects
_pkgname=terminaltexteffects
pkgver=0.15.0
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
b2sums=('67f591e5bb1be0340c992d9cd5eb4e9b2c83409ec8d8104dd0d3d0cea37de946710c64adca3d71cce3fc89838a3d40b3dad08853d1d017cb2f108692bad31f30')


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
