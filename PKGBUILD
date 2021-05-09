# Maintainer: Joermungand <joermungand at gmail dot com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=('python2-pillow')
pkgver=6.2.2
pkgrel=1
_appname=Pillow
_py2basever=2.7
arch=('x86_64')
url="https://python-pillow.org/"
license=('BSD')
pkgdesc="Python Imaging Library (PIL) fork."
depends=('python2' 'freetype2' 'lcms2' 'libraqm' 'libtiff' 'openjpeg2' 'libimagequant' 'libxcb')
optdepends=('libwebp: for webp images'
            'tk: for the ImageTK module'
            'python-olefile: OLE2 file support'
            'python-pyqt5: for the ImageQt module')
makedepends=('python2-setuptools' 'libwebp' 'tk')
checkdepends=('python2-pytest')
source=(${pkgname#*-}-${pkgver}.tar.gz::https://github.com/python-pillow/${_appname}/archive/${pkgver}.tar.gz)
sha256sums=('cc4ec754ddcc98b7166a1afe062c6355c841776145f0f23bdd3bea1eaa41e2db')

build() {
  cd $srcdir/${_appname}-${pkgver}
  python2 setup.py build
}

package() {
  cd $srcdir/${_appname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/include/python$_py2basever/"
  install -m644 -t "$pkgdir/usr/include/python$_py2basever/" src/libImaging/*.h
}
