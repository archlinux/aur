# Maintainer: jjacky
pkgname=kalu
pkgver=4.0.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64')
url="http://jjacky.com/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=5.0' 'pacman<5.1' 'curl' 'libnotify'
         'notification-daemon')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
install=kalu.install
sha1sums=('e2371f96c4df528564e8da96350ac832ac331e95')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  chmod 750 "$pkgdir/usr/share/polkit-1/rules.d"
  chown 0:102 "$pkgdir/usr/share/polkit-1/rules.d"
}

# vim:set ts=2 sw=2 et:
