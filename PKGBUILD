# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=xword-dl-git
pkgver=2023.12.2.r25.g3f75dbc
pkgrel=1
pkgdesc='Command-line tool to download .puz files for online crossword puzzles'
arch=(any)
url='https://github.com/thisisparker/xword-dl'
license=(MIT)
depends=(
	python
	python-beautifulsoup4
	python-dateparser
	python-emoji
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
