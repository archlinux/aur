# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl-git
pkgver=2023.1.31.r0.gf926a73
pkgrel=1
pkgdesc='Command-line tool to download .puz files for online crossword puzzles'
arch=(any)
url='https://github.com/thisisparker/xword-dl'
license=(MIT)
depends=(
	python-argparse
	python-beautifulsoup4
	python-dateparser
	python-html2text
	python-puzpy
	python-requests
	python-unidecode
	python-xmltodict
	python-yaml
)
makedepends=(
	git
	python-setuptools
)
provides=(xword-dl)
conflicts=(xword-dl)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd xword-dl
	git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd xword-dl
	python setup.py build
}

package() {
	cd xword-dl
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
