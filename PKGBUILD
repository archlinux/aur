# Maintainer:
# Contributor: Fabio Comuni <fabrix.xm@gmail.com>

_pkgname="quirc"
pkgname="$_pkgname"
pkgver=1.2
pkgrel=3
pkgdesc="QR decoder library"
url="https://github.com/dlbeer/quirc"
license=('ISC')
arch=('i686' 'x86_64')

depends=(
  'libjpeg'
  'sdl_gfx'
  'sdl12-compat'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('73c12ea33d337ec38fb81218c7674f57dba7ec0570bddd5c7f7a977c0deb64c5')

build() {
  cd "$_pkgsrc"
  CFLAGS+=" -fPIC" make libquirc.so quirc-demo quirc-scanner
}

package() {
  cd "$_pkgsrc"
  install -Dm644 "lib/quirc.h" "$pkgdir/usr/include/quirc.h"

  install -Dm644 "libquirc.so.$pkgver" -t "$pkgdir/usr/lib/"
  ln -s "libquirc.so.$pkgver" "$pkgdir/usr/lib/libquirc.so"

  install -Dm755 quirc-demo -t "$pkgdir/usr/bin/"
  install -Dm755 quirc-scanner -t "$pkgdir/usr/bin/"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
