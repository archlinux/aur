# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=tinytriangle
pkgver=0.2
pkgrel=2
pkgdesc="Linux 4k intro skeleton (demoscene)"
arch=('x86_64' 'i686')
url="http://roboticoverlords.org/tinytriangle/"
license=('ZLIB')
depends=('libgl' 'alsa-lib' 'sdl')
_target="native"
makedepends=('elfkickers')
source=("http://roboticoverlords.org/tinytriangle/$pkgname-$pkgver.xz"
        "http://roboticoverlords.org/$pkgname/$pkgname.desktop"
        "http://roboticoverlords.org/$pkgname/$pkgname.png")
sha256sums=('aa638019bcc60c862fc264095d33add8871ceb0f729ba4b71c74c5343b68843e'
            'e26f2adea9a317971563f773a11177c784d3dbe3c29cedf8cae33ac4514c67ed'
            'a3c74ce02bfe583709ed8d5d40147994362bf14f218e747a3ec3a29561b5effa')

build() {
  cd "$pkgname-$pkgver"

  # the 32-bit version is slightly smaller, but requires libraries that
  # has been removed from AUR, such as lib32-alsa
  make native
}

package() {
  cd "$pkgname-$pkgver"

  msg2 "Packaging sources..."
  mkdir -p "$pkgdir/usr/src/$pkgname"
  cp Makefile README *.{c,s,sh} "$pkgdir/usr/src/$pkgname"

  msg2 "Packaging binary, icon and shortcut..."
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "../$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "../$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  msg2 "Packaging license..."
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
