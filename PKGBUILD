# Maintainer: Thulinma
# Contributor: jjacky
pkgname=kalu
pkgver=4.7.2
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=6.1' 'pacman<7.2' 'curl' 'libnotify' 'libdbusmenu-gtk3')
provides=('kalu-kde')
conflicts=('kalu-kde')
makedepends=('perl' 'groff')
source=(https://github.com/Thulinma/kalu/archive/refs/tags/$pkgver.tar.gz)
install=kalu.install
sha256sums=('c89515e332bc064b0a78bd00ca819ad6f7a72ae6ce2b7aa1c77cb59025469998')

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

