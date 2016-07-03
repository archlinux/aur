# Maintainer: bazzletoe <barry.keegan at gmail.com>
_pkgname=nwjs-sdk
pkgname=$_pkgname
pkgver=0.15.4
pkgrel=1
pkgdesc="node-webkit is an app runtime based on Chromium and node.js. SDK version includes dev tools."
arch=("i686" "x86_64")
url="https://github.com/nwjs/nw.js"
license=("MIT")
depends=("alsa-lib" "gconf" "gtk2" "nss" "ttf-font" "libxtst" "libxss")
optdepends=(
    "nodejs: npm package support"
    "nw-gyp: native add-on build tool for node-webkit"
)
provides=("node-webkit" "nwjs")
replaces=("node-webkit")
conflicts=("node-webkit" "nwjs")

if [ "$CARCH" = "i686" ]; then
  _arch="ia32"
fi
if [ "$CARCH" = "x86_64" ]; then
  _arch="x64"
fi
source_common="http://dl.nwjs.io/v$pkgver/$_pkgname-v$pkgver-linux"
source_i686=("$source_common-ia32.tar.gz")
source_x86_64=("$source_common-x64.tar.gz")
sha256sums_i686=("12d5c88f776bb3b372b0bd589b8090ddf22fa7d93986d6de5734eef3388e9dee")
sha256sums_x86_64=("752bab1ca2cacb65ec0d342d71b4b7bcd788ba55e34ba6f61ba620a7fe0b7f19")

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-$_arch"
  install -Ddm755 "$pkgdir/opt/$_pkgname"
  install -Ddm755 "$pkgdir/usr/bin"
  chmod -R +r *
  chmod +x nw lib lib/lib{ffmpeg,node,nw}.so locales
  cp -r * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
