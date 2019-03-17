# Maintainer:  Stephen Gregoratto <dev@sgregoratto.me>
pkgname=sqlite2mdoc
pkgver=0.1.4
pkgrel=1
pkgdesc='Extract C reference manpages from SQLite header file'
url='https://github.com/kristapsdz/sqlite2mdoc'
license=('ISC')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://kristaps.bsd.lv/sqlite2mdoc/snapshots/$pkgname-$pkgver.tar.gz")
sha256sums=('df6f0adee1a04e37baad9d879d1ae24fae0e77b29d59d57cef4ca38fc4dfd16f')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" make install

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '3,15p' main.c | cut -c 4- > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
