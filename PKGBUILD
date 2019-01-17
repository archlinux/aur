# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=Chess
pkgname=chess.app
pkgrel=1
pkgver=2.8
pkgdesc='Chess for GNUstep ported from OPENSTEP'
arch=('i686' 'x86_64' 'armv7h')
url='https://packages.debian.org/sid/gnustep/chess.app'
license=('BSD')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://http.debian.net/debian/pool/main/c/chess.app/chess.app_2.8.orig.tar.gz"
        "http://http.debian.net/debian/pool/main/c/chess.app/chess.app_2.8-1.debian.tar.xz")
sha256sums=('0a504959ab9699b04055c6844fc62346f1791c67c155f2de62f885c674ab4bd8'
            'f47f4926cc819a3a6268f731a72748e3f6d719da8d82ea75183fdb99edf58ce1')

prepare() {
  cd "$pkgname-33"
  patch < ../debian/patches/improve-chessinfo-plist
}

build() {
  cd "$pkgname-33"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$pkgname-33"
  make DESTDIR="$pkgdir" install
  echo "Name=Chess" >> "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop"
  sed -i "s/Applications.app/Applications\/Chess.app/" "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop"
  sed -i "s/ChessApp.tiff/chess.icns/" "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop"
install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
