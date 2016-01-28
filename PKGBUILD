pkgname=dwm-custom
pkgver=0.3
pkgrel=1
pkgdesc="A helper for compiling dwm in userspace (default=6.1)"
url="https://git.framasoft.org/bobo/dwm-custom"
arch=('any')
license=('GPL3')
depends=('dwm' 'tar' 'sed' 'wget' 'patch' 'leafpad')
source=("https://git.framasoft.org/bobo/dwm-custom/raw/master/snapshot/dwm-custom-$pkgver.tar.gz")
md5sums=('2a4bb0d29f3afce656900b448b2bc926')


prepare() {
  sed -i -e "s:DOCDIR=.*:DOCDIR=/usr/share/doc/$pkgname:" $srcdir/$pkgname-build
  sed -i -e "s:RESCUEDIR=.*:RESCUEDIR=/usr/share/$pkgname/rescue:" $srcdir/$pkgname-build
}

package() {
  install -m 755 -d $pkgdir/usr/bin
  install -m 755 -d $pkgdir/usr/share/xsessions
  install -m 755 -d $pkgdir/usr/share/$pkgname
  install -m 755 -d $pkgdir/usr/share/doc/$pkgname
  cp -a $srcdir/$pkgname-build $pkgdir/usr/bin
  cp -a $srcdir/xsession/$pkgname-session $pkgdir/usr/bin
  cp -a $srcdir/xsession/$pkgname.desktop $pkgdir/usr/share/xsessions
  cp -a $srcdir/rescue $pkgdir/usr/share/$pkgname
  cp -a $srcdir/doc/* $pkgdir/usr/share/doc/$pkgname
}
