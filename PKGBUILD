# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: lth <manuelung@gmail.com>
# Contributor: nizox <nizzox@gmail.com>
pkgname=dhcpcd-ui
pkgver=0.8.0
pkgrel=1
pkgdesc="dhcpcd Monitor in GTK+"
url="http://roy.marples.name/projects/dhcpcd-ui"
license=(BSD-2-Clause)
depends=("gtk2" "libnotify" "hicolor-icon-theme")
makedepends=("python-cairosvg" "python-xcffib")
#source=(http://roy.marples.name/downloads/dhcpcd/$pkgname-$pkgver.tar.xz)
source=("https://github.com/NetworkConfiguration/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
arch=(i686 x86_64)
md5sums=('c85a624c08a63b6a4ded16723a7ebdfa')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --without-qt
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" AUTOSTARTDIR=/etc/xdg/autostart ICONDIR=/usr/share/icons install 

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '1,/^$/p' src/dhcpcd-gtk/main.c \
	>"$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
