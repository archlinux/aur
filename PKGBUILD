# Maintainer: TwoFinger
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=ded
pkgver=20240424
_td_pkgver=20240421
pkgrel=2
pkgdesc="directory editor, file manager similar to Emacs dired"
arch=(i686 x86_64)
url="https://invisible-island.net/ded/ded.html"
license=(custom:BSD)
depends=(ncurses)
source=(https://invisible-island.net/archives/ded/$pkgname-$pkgver.tgz
        https://invisible-island.net/archives/ded/td_lib-$_td_pkgver.tgz)
sha256sums=(
            acc62c5e3f7de331a7ce56b54068224bf73ab0bebc2039baacb7180873fb720f
            58f392cd0464e3e2cdc9e4e4a0e43abd12643e6131b4bd398682001299452ba5
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
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
