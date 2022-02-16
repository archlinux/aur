# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-pywebview
pkgver=3.6
pkgrel=1
pkgdesc="Build GUI for your Python program with JavaScript, HTML, and CSS."
arch=('any')
url='https://github.com/r0x0r/pywebview'
license=('BSD')
depends=('python' 'python-proxy_tools')
makedepends=('python-setuptools')
optdepends=('python-gobject: use with GTK'
	'python-cairo: use with GTK'
	'webkit2gtk>=2.22: use with GTK'
	'qt5-webkit: use with Qt'
	'python-qtpy: use with Qt'
	'python-pyqt5-webengine: use with Qt (PyQt5)'
	'python-pyqt5: use with Qt (PyQt5)'
	'pyside2: use with Qt (PySide2)'
	'pyside6: use with Qt (PySide6)')
install="$pkgname.install"
source=("https://pypi.python.org/packages/source/p/pywebview/pywebview-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/r0x0r/pywebview/master/LICENSE.md")
sha256sums=('fd49a678a14f41996a02167a419d49256c6a9fd8c4112bc795a8db558a7fba18'
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
