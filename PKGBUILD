# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor: RiverOnVenus <error@zhui.dev>

pkgname=python-terminaltexteffects
_pkgname=terminaltexteffects
pkgver=0.14.2
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
b2sums=('c7ff3b302ee110305d73f2f66c6ff5ff2ad338816c1de7120be4b5bc6bf407ae414478b289a2742d592698c5a71c2c6c845ecad60cb1cdc2890fc8b7914a9dfb')


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
