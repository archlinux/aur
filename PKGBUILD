# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: lth <manuelung@gmail.com>
# Contributor: nizox <nizzox@gmail.com>
pkgname=dhcpcd-ui
pkgver=0.7.9
pkgrel=1
pkgdesc="dhcpcd Monitor in GTK+"
url="http://roy.marples.name/projects/dhcpcd-ui"
license=("BSD")
depends=("gtk2" "libnotify" "dhcpcd-dbus>=0.6.0" "hicolor-icon-theme")
makedepends=("python-cairosvg" "python-xcffib")
#source=(http://roy.marples.name/downloads/dhcpcd/$pkgname-$pkgver.tar.xz)
source=("https://github.com/NetworkConfiguration/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
arch=(i686 x86_64)
md5sums=('e3b0b1506688c71742a65a76c740a0e0')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --icondir=/usr/share/icons --without-qt
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" AUTOSTARTDIR=/etc/xdg/autostart install 

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '1,/^$/p' src/dhcpcd-gtk/main.c \
	>"$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
