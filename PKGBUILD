# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
pkgver=4.9.3
pkgrel=1
pkgdesc='Python2 binding for the libxml2 and libxslt libraries'
arch=('i686' 'x86_64' 'armv7h')
url='https://lxml.de/'
license=('BSD' 'custom')
depends=('python2' 'libxslt')
makedepends=('python2-setuptools' 'cython2')
optdepends=(
	'python2-beautifulsoup4: malformed HTML parsing support'
	'python2-cssselect: CSS parsing support'
	'python2-html5lib: HTML5 parsing support'
)
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz")
sha512sums=('74d40cbd02fc0329b789274b544af296edcb99e4c1a544dfbb7a90fdbe3e23b2621c5dfe7be3970f43c98cdd3d9bef9d5792c68db4648c2a12884b8104e1e1dc')
_dir="lxml-lxml-${pkgver}"

build() {
	cd "${_dir}"
	python2 setup.py build build_ext -i
	#make PYTHON=python2
}

check() {
	cd "${_dir}"
	# need to use UTF-8 based locale; tests fail with e.g. LC_ALL=C
	#make LC_ALL=C.UTF-8 PYTHON=python2 test_build
	LC_ALL=C.UTF-8 python2 test.py -p -v
}

package() {
	cd "${_dir}"
	python2 setup.py install --root "${pkgdir}" --prefix=/usr --optimize=1 --skip-build
	
	install -Dm644 'LICENSES.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'doc/licenses/BSD.txt' "$pkgdir/usr/share/licenses/$pkgname/BSD.txt"
	install -Dm644 'doc/licenses/elementtree.txt' "$pkgdir/usr/share/licenses/$pkgname/elementtree.txt"
}
