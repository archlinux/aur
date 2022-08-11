# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: minder

pkgname=python2-pillow
pkgver=6.2.2
pkgrel=3
_appname=Pillow
_py2basever=2.7
pkgdesc="Python Imaging Library (PIL) fork"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://python-pillow.github.io/"
license=(BSD)
depends=(python2 lcms2 libtiff openjpeg2 libimagequant libxcb)
optdepends=('freetype2: for the ImageFont module'
            'libraqm: for complex text scripts'
            'libwebp: for webp images'
            'tk: for the ImageTK module'
            'python2-olefile: OLE2 file support'
            'python2-pyqt5: for the ImageQt module')
makedepends=(python2-setuptools freetype2 libraqm libwebp tk)
conflicts=(python2-imaging)
source=("https://files.pythonhosted.org/packages/source/P/$_appname/$_appname-$pkgver.tar.gz")
sha256sums=('db9ff0c251ed066d367f53b64827cc9e18ccea001b986d08c265e53625dab950')

build() {
  cd "$srcdir/$_appname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_appname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/include/python$_py2basever/"
  install -m644 -t "$pkgdir/usr/include/python$_py2basever/" src/libImaging/*.h
}
