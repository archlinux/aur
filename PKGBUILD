# Maintainer: lth <manuelung@gmail.com>
# Contributor: nizox <nizzox@gmail.com>
pkgname=dhcpcd-ui
pkgver=0.7.5
pkgrel=1
pkgdesc="dhcpcd Monitor in GTK+"
url="http://roy.marples.name/projects/dhcpcd-ui"
license=("BSD")
depends=("gtk2" "libnotify" "dhcpcd-dbus>=0.6.0" "hicolor-icon-theme")
install=dhcpcd-ui.install
source=(http://roy.marples.name/downloads/dhcpcd/$pkgname-$pkgver.tar.bz2)
arch=(i686 x86_64)
md5sums=('ff937ffe2ffc2801488078a61bdbfd0d')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --icondir=/usr/share/icons --without-qt
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" AUTOSTARTDIR=/etc/xdg/autostart install 

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '1,/^$/p' src/dhcpcd-gtk/main.c \
	>"$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
