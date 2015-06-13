# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: DarkHeart <fumbles@ymail.com>

pkgname=emma
pkgver=0.6
pkgrel=4
pkgdesc="A platform-independent mysql administrator frontend using python and gtk+"
arch=('any')
url="http://www.fastflo.de/projects/emma"
license=('GPL')
depends=('python2' 'pygtk' 'mysql-python')
source=(http://www.fastflo.de/files/emma/downloads/python_src/$pkgname-$pkgver.tar.gz \
  $pkgname.desktop)

md5sums=('da3bd1d1f4ee75d02a4c8637e28fd732'
         '2c1a3d150735ea8be085c44e6f406771')

build() {
  cd $srcdir/$pkgname-$pkgver
  find . -name '*.py' -exec sed -i 's|/usr/bin/env python2.4|/usr/bin/python2|' {} \;
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  install -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/$pkgname-$pkgver/icons/$pkgname.png $pkgdir/usr/share/pixmaps/
}
