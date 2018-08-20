# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=FontManager
pkgname=fontmanager.app
pkgrel=1
pkgver=0.1
pkgdesc='Clone of MacOSX Font Book'
arch=('i686' 'x86_64' 'armv7h')
url='https://packages.debian.org/unstable/gnustep/fontmanager.app'
license=('BSD')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://http.debian.net/debian/pool/main/f/fontmanager.app/fontmanager.app_0.1.orig.tar.gz")
sha256sums=('c84957bcf7befeb43978cda5b55bb3f4272678a76a62261bd8b557c8f1fec489')

prepare() {
  cd "$_pkgname-master"
  sed -i "s/Font Manager/FontManager/g" FontManagerInfo.plist
} 

build() {
  cd "$_pkgname-master"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-master"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}