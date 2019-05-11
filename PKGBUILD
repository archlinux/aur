# Maintainer: <mumei AT airmail DOT cc>

_pkgname=TextEdit
pkgname=textedit-classic.app
pkgrel=1
pkgver=4.0+20061029  
pkgdesc='A text editor with font, color, and style capabilities for GNUstep'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.nongnu.org/backbone/'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
conflicts=('textedit.app')
source=("http://http.debian.net/debian/pool/main/t/textedit.app/textedit.app_4.0+20061029.orig.tar.gz"
        "http://http.debian.net/debian/pool/main/t/textedit.app/textedit.app_4.0+20061029-3.5.diff.gz")
sha256sums=('3abb2ae8142edc64feb8b44dec3d449f6c72a0059253ab979ec335b8766b03dd'
            'd9cc1881003e62e1f1997566b5885ae766ad53905c9870ec62712b4d1164fb33')

prepare() {
  cd "textedit.app-$pkgver"
  for patch in ../*.diff; do 
    patch < $patch
  done
}

build() {
  cd "textedit.app-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "textedit.app-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
