# Maintainer: Roman Mishin <xtradev (a) yandex (.) ru>
pkgname=sfk-bin
pkgver=1.9.6.2
pkgrel=1
pkgdesc="Swiss File Knife - a command line tools collection"
arch=('x86_64')
url='http://stahlworks.com/dev/swiss-file-knife.html'
license=('BSD')
depends=('gcc-libs')
makedepends=('awk')
provides=('sfk')
conflicts=('sfk')
_bin='sfk-linux-64.exe'
source=("http://stahlworks.com/dev/sfk/$_bin")
noextract=("$_bin")
md5sums=('2af001a0bfd9cfe675be2a0d4f2a31b3')

prepare() {
  cp "$_bin" "$srcdir/sfk"
  chmod  +x  "$srcdir/sfk"
}

pkgver() {
  "$srcdir/sfk" ver -own | awk '{print $5}'
}

package() {
  install -DT "$srcdir/sfk" "$pkgdir/usr/bin/sfk"
  install -dm755            "$pkgdir/usr/share/licenses/sfk"
     "$srcdir/sfk" license >"$pkgdir/usr/share/licenses/sfk/LICENSE" || true
  rm "$srcdir/sfk"
}
