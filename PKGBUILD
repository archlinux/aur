# Maintainer: Liliane Fontenot <projects@liliane.io>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl
pkgver=2025.8.4
pkgrel=2
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
sha256sums=('eecb524e823813be61bda0a75e304846e2a8599765f624f5dc2ea60e3d3c513a')

build() {
	cd "${pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}"
	python -m installer -d "${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
