# Maintainer: TwoFinger
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=ded
pkgver=20131205
_td_pkgver=20131205
pkgrel=2
pkgdesc="directory editor, file manager similar to Emacs dired"
arch=('i686' 'x86_64')
url="https://invisible-island.net/ded/ded.html"
license=('custom:BSD')
depends=('ncurses')
source=(https://invisible-island.net/archives/ded/$pkgname-$pkgver.tgz
        https://invisible-island.net/archives/ded/td_lib-$_td_pkgver.tgz)
sha256sums=('44f336f7457de65d6d5c645a0334e283453c3649582b2e38baa807b05ab49ff9'
            '1215084ec099f961a8a4de01959c6e894cd5003847c5a10290e1e782f2a0721b')

build() {
  cd "$srcdir/td_lib-$_td_pkgver"
  ./configure --prefix=/usr
  make -j1

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
