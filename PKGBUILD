# Maintainer: <mumei AT airmail DOT cc>

pkgname=gemas.app
_pkgname=Gemas
pkgrel=1
pkgver=0.4
pkgdesc="A simple code editor with highlight syntax and auto indentation"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gnustep-nonfsf/gemas/index.html"
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'highlighterkit')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://download.savannah.nongnu.org/releases/gnustep-nonfsf/Gemas-0.4.tar.gz")
sha256sums=('db1709aac8ed4d5c609c19a922eb2d6ea518e5379a068dd03b2635970b4c59cd')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}