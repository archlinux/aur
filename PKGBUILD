# Maintainer: <mumei AT airmail DOT cc>

_pkgname=GSFTP
pkgname=waiho.app
pkgrel=1
pkgver=0.1
pkgdesc='GUI FTP client with ability to queue files and directories'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.roard.com/waiho/description.html'
license=('GPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://www.roard.com/waiho/download/GSFTP-0.1.tgz")
sha256sums=('f7356d13676fb6f1fd8d60346b1dec8fa29e9226f047f2d98d60cbe975a8bacb')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i "s/GSFTP.app/GSFTP/" GSFTPInfo.plist
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
