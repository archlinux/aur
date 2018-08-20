# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=Waiho
pkgname=waiho.app
pkgrel=1
pkgver=0.2
pkgdesc='GUI FTP client with ability to queue files and directories'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.roard.com/waiho/description.html'
license=('GPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://www.roard.com/waiho/download/Waiho-0.2.tgz")
sha256sums=('e3f496896a82766e2b2a4dc41bb9c7b5bb2e97cbdb6e46cc19925134f4c9d06c')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i "s/Waiho.app/Waiho/g" WaihoInfo.plist
} 

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}