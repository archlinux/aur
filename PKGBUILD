# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: jjacky

pkgname=kalu-kde
_pkgname_orig=kalu
pkgver=3.0.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news; supports autohide in KDE's panel"
arch=('i686' 'x86_64')
url="http://jjacky.com/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.2' 'pacman<4.3' 'curl' 'libnotify'
         'notification-daemon' 'statusnotifier')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$_pkgname_orig/$_pkgname_orig-$pkgver.tar.gz)
install=kalu.install
sha1sums=('26ef0abb23d4590c3b851d6f61f4063e84e181f3')
provides=($_pkgname_orig)
conflicts=($_pkgname_orig)

build() {
  cd "$srcdir/$_pkgname_orig-$pkgver"
  ./configure --prefix=/usr --enable-status-notifier
  make
}

package() {
  cd "$srcdir/$_pkgname_orig-$pkgver"
  make DESTDIR="$pkgdir/" install
  chmod 700 "$pkgdir/usr/share/polkit-1/rules.d"
  chown 102 "$pkgdir/usr/share/polkit-1/rules.d"
}

# vim:set ts=2 sw=2 et:
