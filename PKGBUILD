# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
pkgver=4.9.4
pkgrel=1
pkgdesc='Python2 binding for the libxml2 and libxslt libraries'
arch=('i686' 'x86_64' 'armv7h')
url='https://lxml.de/'
license=('BSD' 'custom')
depends=('python2' 'libxslt' 'libxml2')
makedepends=('python2-setuptools' 'cython2')
optdepends=(
	'python2-beautifulsoup4: malformed HTML parsing support'
	'python2-cssselect: CSS parsing support'
	'python2-html5lib: HTML5 parsing support'
)
checkdepends=(
	'python2-cssselect'
)
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz")
sha512sums=('528ef4ae057a7ee54d3193a042a6db500ada883d1d506829b6824d91ec979feb69ec79239420112eae0e08a437b2e5da8efc35feb5d04d119bfae2679e918d29')
_dir="lxml-lxml-${pkgver}"

build() {
	cd "${_dir}"
	python2 setup.py build build_ext -i
}

check() {
	cd "${_dir}"
	# need to use UTF-8 based locale; tests fail with e.g. LC_ALL=C
	LC_ALL=C.UTF-8 python2 test.py -p -v
}

package() {
	cd "${_dir}"
	python2 setup.py install --root "${pkgdir}" --prefix=/usr --optimize=1 --skip-build
	
	install -Dm644 'LICENSES.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'doc/licenses/BSD.txt' "$pkgdir/usr/share/licenses/$pkgname/BSD.txt"
	install -Dm644 'doc/licenses/elementtree.txt' "$pkgdir/usr/share/licenses/$pkgname/elementtree.txt"
}
