# Maintainer: TDY <tdy@gmx.com>

pkgname=kodos
pkgver=2.4.9
pkgrel=1
pkgdesc="A Python regular expression debugger"
arch=('i686' 'x86_64')
url="http://kodos.sourceforge.net/"
license=('GPL')
depends=('pyqt3')
source=(http://downloads.sourceforge.net/kodos/kodos-$pkgver.tar.gz
        kodos.desktop)
md5sums=('d608c8b3484667d3a82ba6dfe29bb18d'
         '0e06be9caa216b3e0616ed5cedcc7ada')

build() {
  cd "$srcdir/kodos-$pkgver"
  ln -sf kodos{.py,}
  sed -i '39 s/\.py//' setup.py
  python2 setup.py build
}

package() {
  cd "$srcdir/kodos-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 images/kodos_icon.png "$pkgdir/usr/share/pixmaps/kodos.png"
  install -Dm644 ../kodos.desktop "$pkgdir/usr/share/applications/kodos.desktop"
}
