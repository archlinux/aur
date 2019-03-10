# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: tochiro@no.spam.mail.berlios.de
# Contributor: Thor "Third3ye" <tredje0ye@gmail.com>

pkgname=aspell-nb
pkgver=0.50.1
pkgrel=2
pkgdesc='Norwegian Bokmål dictionary for aspell'
arch=(any)
url='https://aspell.net/'
license=(GPL)
depends=(aspell)
makedepends=(convmv)
source=("ftp://ftp.gnu.org/gnu/aspell/dict/nb/$pkgname-$pkgver-0.tar.bz2")
sha256sums=('e7746e8b617b2df576c1172399544818084524504202b16c747f52db5e5d228a')

build() {
  cd "$pkgname-$pkgver-0"
  ./configure
  make
}

package() {
  make -C "$pkgname-$pkgver-0" DESTDIR="$pkgdir" install
  convmv --notest -f iso-8859-1 -t UTF-8 \
    "$pkgdir"/usr/lib/aspell-0.60/bokm*l.alias
}

# vim: ts=2 sw=2 et:
