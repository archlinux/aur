# Maintainer: Benson Muite <benson_muite at emailplus dot org>


pkgname=inkcut
_pkg=inkcut
epoch=
pkgver=2.1.7
pkgrel=00
pkgdesc='An application for controlling 2D plotters, cutters, engravers, and CNC machines.'
arch=(any)
url=https://github.com/inkcut/inkcut
license=(GPLv3)
depends=(
	 'inkscape'
	 'python'
	 'python-enaml'
	 'python-twisted'
	 'python-pyqtgraph'
	 'python-qtconsole'
	 'python-pyserial'
	 'python-jsonpickle'
	 'python-lxml'
	 'python-pyqt6'
	 'python-qt-reactor')
depends+=(
	  'python-numpy')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel')
optdepends=()
checkdepends=(
	'python-pytest'
	'python-pytest-qt')
source=("https://github.com/inkcut/inkcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5df2c0ab3a92fc9f63659389c5aee9a01220e6b4ec54db74da4664436230dd28')

build() {
	cd "$_pkg-$pkgver"
	python setup.py bdist_wheel
}

check() {
	cd "$_pkg-$pkgver"
        QT_QPA_PLATFORM=offscreen python -m pytest tests
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	# Inkscape extension
        mkdir -p $pkgdir/usr/share/inkscape/extensions
        cp -a plugins/inkscape/ink* $pkgdir/usr/share/inkscape/extensions/
	install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
	install -m755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

