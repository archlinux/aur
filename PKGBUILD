# Maintainer: TwoFinger
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=ded
pkgver=20250928
_td_pkgver=20250928
pkgrel=1
pkgdesc="directory editor, file manager similar to Emacs dired"
arch=(i686 x86_64)
url="https://invisible-island.net/ded/ded.html"
license=(custom:BSD)
depends=(ncurses)
# Just in case neither $EDITOR is set, nor vi/vim/vile/ed were installed.
# Can be uninstalled later.
makedepends=(ed)
source=(https://invisible-island.net/archives/ded/$pkgname-$pkgver.tgz
        https://invisible-island.net/archives/ded/td_lib-$_td_pkgver.tgz)
sha256sums=(
            b5bfb0850a70f3b1e64c9736e73d00788442bfc4c273b5b3d13f68f454a8c530
            8854186a30eb4fd842397f54afe9309bfa53607bf60a9cf8e0b2a6b7231a35a3
           )

build() {
  cd "$srcdir/td_lib-$_td_pkgver"
  ./configure --prefix=/usr
  make -j1

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -j1 DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
