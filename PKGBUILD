# Maintainer: Joseph Carta <cartakid@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: minder

pkgname=python37-pillow
pkgver=6.2.1
pkgrel=1
_appname=Pillow
_py3basever=3.7
pkgdesc="Python Imaging Library (PIL) fork. Python3.7 version."
arch=('x86_64')
url="https://python-pillow.github.io/"
license=('BSD')
depends=('python37' 'lcms2' 'libtiff' 'openjpeg2' 'libimagequant')
optdepends=('freetype2: for the ImageFont module'
            'libraqm: for complex text scripts'
            'libwebp: for webp images'
            'tk: for the ImageTK module'
            'python-olefile: OLE2 file support'
            'python-pyqt5: for the ImageQt module')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/P/$_appname/$_appname-$pkgver.tar.gz")
md5sums=('13acde283ece6ac69f62609fa108d316')

prepare() {
  cd "$srcdir/$_appname-$pkgver"
}

build() {
  cd "$srcdir/$_appname-$pkgver"
  python3.7 setup.py build
}

package () {
  cd "$srcdir/$_appname-$pkgver"
  python3.7 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/include/python$_py3basever/"
  install -m644 -t "$pkgdir/usr/include/python$_py3basever/" src/libImaging/*.h
}
