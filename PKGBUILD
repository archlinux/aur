# Maintainer: Liliane Fontenot <projects@liliane.io>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl
pkgver=2025.10.3
pkgrel=1
pkgdesc='Command-line tool to download .puz files for online crossword puzzles'
arch=(any)
url='https://github.com/thisisparker/xword-dl'
license=(MIT)
depends=(
	python-beautifulsoup4
	python-dateparser
	python-emoji
	python-html2text
	python-lxml
	python-puzpy
	python-requests
	python-unidecode
	python-xmltodict
	python-yaml
)
makedepends=(git python-hatchling python-hatch-vcs)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('333c09072afc33be9adc860e0ce277b4bef14d43770469e1cd9982dbce3856f4')

build() {
	cd "${pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}"
	python -m installer -d "${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
