# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: AdmiringWorm <kim.nordmo@gmail.com>
pkgname=enki-editor
_pkgname=enki
pkgver=19.10.0
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
sha256sums=('70764f0ec564224df5699fe017d5de94c77455453e0ec9dcdd5415f8517f22db')

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
