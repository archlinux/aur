# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
pkgver=4.9.0
pkgrel=2
pkgdesc='Python2 binding for the libxml2 and libxslt libraries'
arch=('i686' 'x86_64' 'armv7h')
url='https://lxml.de/'
license=('BSD' 'custom')
depends=('python2' 'libxslt')
checkdepends=('python2-beautifulsoup4' 'python2-cssselect' 'python2-html5lib')
makedepends=('python2-setuptools' 'cython2')
optdepends=(
	'python2-beautifulsoup4: malformed HTML parsing support'
	'python2-cssselect: CSS parsing support'
	'python2-html5lib: HTML5 parsing support'
)
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz")
sha512sums=('fb88b2e9d92972de69c1f8b54529ea00364b8b72475a2a88c9c509e4fb8cfbf0ced1bc093f96ae60c1d275ee9a8e5a5d2f51472ecce3d706a1cb1299789f9495')
_dir="lxml-lxml-${pkgver}"

build() {
	cd "${_dir}"
	#python2 setup.py build
	make PYTHON=python2
}

check() {
	cd "${_dir}"
	# need to use UTF-8 based locale; tests fail with e.g. LC_ALL=C
	make LC_ALL=C.UTF-8 PYTHON=python2 test
}

package() {
	cd "${_dir}"
	python2 setup.py install --root "${pkgdir}" --prefix=/usr --optimize=1 --skip-build
	#DESTDIR="${pkgdir}" make PYTHON=python2 install
	
	install -Dm644 'LICENSES.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'doc/licenses/BSD.txt' "$pkgdir/usr/share/licenses/$pkgname/BSD.txt"
	install -Dm644 'doc/licenses/elementtree.txt' "$pkgdir/usr/share/licenses/$pkgname/elementtree.txt"
}
