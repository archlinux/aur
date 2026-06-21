# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgauthor="royreznik"
pkgname="rexi"
pkgver=1.2.1
pkgrel=1
pkgdesc="Terminal UI for Regex Testing"

arch=('any')
license=('MIT')
url="https://github.com/${pkgauthor}/${pkgname}"

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
depends=('python' 'python-textual' 'python-colorama' 'python-typer')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ef7e7adcd51b3f23ec0e5dd64c9fec1767e33e53bfa4421fc193f85930c334125c9093e5ff88304f9a0384a112dbbaba756cc9fb667d4ff3974654aa45ac66df')

build() {
	cd ${pkgname}-${pkgver}

	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
