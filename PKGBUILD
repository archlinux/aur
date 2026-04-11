# Maintainer: Thulinma
# Contributor: jjacky
pkgname=kalu
pkgver=4.6.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Thulinma/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=6.1' 'pacman<7.2' 'curl' 'libnotify' 'notification-daemon')
makedepends=('perl' 'groff')
source=(https://github.com/Thulinma/kalu/archive/refs/tags/$pkgver.tar.gz)
install=kalu.install
md5sums=('f7f31a75b8ca4eceb9f12bf723d3c2a6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  chmod 755 "$pkgdir/usr/share/polkit-1/rules.d"
  chown 0:0 "$pkgdir/usr/share/polkit-1/rules.d"
}

