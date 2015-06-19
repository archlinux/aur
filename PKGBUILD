# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=edid-decode-git
_gitname=edid-decode
pkgver=r111.afcf2a2
pkgrel=1
pkgdesc="EDID decoder and conformance tester"
url="http://cgit.freedesktop.org/xorg/app/edid-decode/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('git')
source=('git://anongit.freedesktop.org/xorg/app/edid-decode')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  make
}
 
package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '1,/^$/p' edid-decode.c | head -n -2 > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}

# vim:set ts=2 sw=2 et:
