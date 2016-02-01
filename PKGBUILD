# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: jjacky

pkgname=kalu-kde
_pkgname_orig=kalu
pkgver=4.0.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news; supports autohide in KDE's panel"
arch=('i686' 'x86_64')
url="http://jjacky.com/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=5.0' 'pacman<5.1' 'curl' 'libnotify'
         'notification-daemon' 'statusnotifier')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$_pkgname_orig/$_pkgname_orig-$pkgver.tar.gz)
install=kalu.install
sha1sums=('e2371f96c4df528564e8da96350ac832ac331e95')
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
  chmod 750 "$pkgdir/usr/share/polkit-1/rules.d"
  chown 0:102 "$pkgdir/usr/share/polkit-1/rules.d"
}

# vim:set ts=2 sw=2 et:
