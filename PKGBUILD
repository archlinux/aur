# Maintainer: Thulinma
# Maintainer: jjacky
pkgname=kalu
pkgver=4.5.2
pkgrel=3
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Thulinma/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=6.1' 'pacman<7.2' 'curl' 'libnotify' 'notification-daemon')
makedepends=('perl' 'groff')
source=(https://github.com/Thulinma/kalu/archive/refs/tags/$pkgver.tar.gz)
install=kalu.install
md5sums=('d112db6a3fffb5dffe95f4e3f4db1caf')

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

