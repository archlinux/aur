# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
pkgname=enki-editor
_pkgname=enki
pkgver=18.08.0
pkgrel=1
pkgdesc="A text editor for programmers"
arch=(any)
url="http://enki-editor.org/"
license=('GPL2')
depends=(
	"python-markdown"
	"python-pyqtwebengine"
	"python-qtconsole" # Required to change settings
	"desktop-file-utils"
	# AUR Packages
	"qutepart")
optdepends=(
	"ctags: For navigation in file"
	"flake8: To lint your Python code."
	"python-docutils: For reStructuredText preview"
	"python-regex: For preview synchronization"
	"python-sphinx: To build Sphinx documentation."
	"python-code-chat-git: For source code to HTML translation (literate programming)"
)
makedepends=("python-setuptools")
source=("https://github.com/andreikop/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1a943a9f5144324ce3bbf9d71de495b24b6a608f20b512cad72597a644a1fc91')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$_pkgname-$pkgver"
	python tests/run_all.py
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
