# Maintainer: Uffe Jakobsen <uffe at uffe dot org>
# Past Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lnav
pkgver=0.8.2
pkgrel=1
pkgdesc="A curses-based tool for viewing and analyzing log files"
arch=(i686 x86_64)
url="http://lnav.org/"
license=('custom:BSD')
depends=('ncurses' 'curl' 'pcre' 'sqlite3')
#source=("https://github.com/tstack/lnav/releases/download/v$pkgver/lnav-$pkgver.tar.gz")
#md5sums=('b60499eee0662887040a98c21aa444b3')
source=("https://github.com/tstack/lnav/archive/v${pkgver}.tar.gz")
md5sums=('c7fc1ca2891f890c184c7d1f2ca1d870')


build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lnav/LICENSE"

  # man
  install -Dm644 lnav.1 "$pkgdir/usr/share/man/man1/lnav.1"
}

# vim:set ts=2 sw=2 et:
