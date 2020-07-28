# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-pywebview
pkgver=3.3.2
pkgrel=1
pkgdesc="Build GUI for your Python program with JavaScript, HTML, and CSS."
arch=('any')
url='https://github.com/r0x0r/pywebview'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-gobject: use with GTK'
	'python-cairo: use with GTK'
	'webkit2gtk>=2.22: use with GTK'
	'python-pyqtwebengine: use with Qt'
	'qt5-webkit: use with Qt')
install="$pkgname.install"
source=("https://pypi.python.org/packages/source/p/pywebview/pywebview-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/r0x0r/pywebview/master/LICENSE.md")
sha256sums=('f3ad2bf1b7438cd882dec485092789368259955eb4166fa92ea9f436baff23cb'
	'4a988dd3598832cd3653de20dc33cb677d0fb53ab5551c879ca31280ae653675')

build() {
	cd "${srcdir}/pywebview-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}"
	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "pywebview-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
