# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=catfish-python2
pkgname_link=catfish
pkgbase=catfish-python2
pkgver=0.3.2
pkgrel=1
pkgdesc="Catfish-python2 is a GTK+ search utility written in python2"
url="https://github.com/Mordillo98/catfish-python2"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
makedepends=('pygtk' 'python2-dbus' 'python2-xdg' 'python2' 'gnome-icon-theme')
source=('https://sourceforge.net/projects/catfish-python2/files/catfish-python2/catfish-python2.tar.xz')
md5sums=('541032a1513a8b0ab8c21fcdf9feb3f2')

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  install -d /$pkgdir/usr/bin
  install $pkgname $pkgdir/usr/bin

  install -d $pkgdir/usr/share/$pkgname
  install $pkgname.pyc $pkgdir/usr/share/$pkgname
  install $pkgname.glade $pkgdir/usr/share/$pkgname

  install -d $pkgdir/usr/share/icons/hicolor/scalable/apps
  install -d $pkgdir/usr/share/pixmaps
  install $pkgname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps

  ln -sf /usr/share/icons/hicolor/scalable/apps/$pkgname.svg $pkgdir/usr/share/pixmaps/$pkgname.svg
  ln -sf /usr/share/icons/hicolor/scalable/apps/$pkgname.svg $pkgdir/usr/share/$pkgname/$pkgname.svg
  
  install -d $pkgdir/usr/share/doc/$pkgname
  install AUTHORS $pkgdir/usr/share/doc/$pkgname
  install COPYING $pkgdir/usr/share/doc/$pkgname
  install ChangeLog $pkgdir/usr/share/doc/$pkgname
  install INSTALL $pkgdir/usr/share/doc/$pkgname
  install README $pkgdir/usr/share/doc/$pkgname

  install -d $pkgdir/usr/share/applications
  install --mode=644 $pkgname.desktop $pkgdir/usr/share/applications

  cp -rf locale $pkgdir/usr/share
  install -d $pkgdir/usr/share/$pkgname/
  ln -sf /usr/share/locale $pkgdir/usr/share/$pkgname/locale
  ln -sf /usr/share/catfish-python2 $pkgdir/usr/share/$pkgname_link

}
