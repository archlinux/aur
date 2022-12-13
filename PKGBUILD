# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
pkgver=4.9.2
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
sha512sums=('816b2fe2eef2a97a0df66cbc39850c6dc3d6470e4033cc73edb40c80c0afbbe6c084d042d7c98b29497926e76f648caa42e1ebe5d83060af08af6972316077b0')
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
