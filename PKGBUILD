_reponame=ldoce5viewer-pyqt5
pkgname=$_reponame-git
pkgver=1.0
pkgrel=4
pkgdesc="LDOCE5 viewer ported to PyQt5 for retina (HiDPI) support. "
license=(GPL3)
conflicts=(ldoce5viewer-git ldoce5viewer)
arch=('i686' 'x86_64')
url='https://github.com/purboo/ldoce5viewer-pyqt5'
depends=(python-pyqt5 python-lxml python-whoosh qt5-webkit qt5-multimedia gst-plugins-good gst-plugins-ugly python-gobject)
source=("git://github.com/purboo/ldoce5viewer-pyqt5.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${_reponame}"
	sed -i "s/import sip/import PyQt5.sip as sip/g" ldoce5viewer/qtgui/__init__.py
  sed -i "s/from cgi import escape/from html import escape/g" ldoce5viewer/qtgui/indexer.py
  sed -i "s/from cgi import escape/from html import escape/g" ldoce5viewer/ldoce5/extract.py
  sed -i "s/from cgi import escape/from html import escape/g" ldoce5viewer/ldoce5/transform.py
	make
}

package() {
	cd "${srcdir}/${_reponame}"

	python setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 "ldoce5viewer/qtgui/resources/ldoce5viewer.svg" \
	"${pkgdir}/usr/share/pixmaps/ldoce5viewer.svg"
	install -Dm644 "ldoce5viewer.desktop" \
	"${pkgdir}/usr/share/applications/ldoce5viewer.desktop"
	install -Dm644 "LICENSE.txt" \
	"${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm644 "COPYING.txt" \
	"${pkgdir}/usr/share/licenses/$pkgname/COPYING.txt"
}

