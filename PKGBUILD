# Maintainer: TwoFinger
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=ded
pkgver=20250117
_td_pkgver=20250117
pkgrel=4
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
            2774cf080151cc3afd7016ecdbffe5726599847dd150dcb043da0067bd06e61f
            172ceee83471e2e221f190e65ca8255d3465f0e6d5a346a8d1efbf008df701bf
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
