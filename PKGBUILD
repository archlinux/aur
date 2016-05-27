# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
_pkgname=nwjs
pkgname=$_pkgname-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="node-webkit is an app runtime based on Chromium and node.js."
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
md5sums_i686=('6cd6996e6e5a343fd1698754f2e30b97')
md5sums_x86_64=('8cceca384d1a0b0b673f7204969658f3')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-$_arch"
  install -Ddm755 "$pkgdir/opt/$_pkgname"
  install -Ddm755 "$pkgdir/usr/bin"
  chmod -R +r *
  chmod +x nw lib lib/lib{ffmpeg,node,nw}.so locales
  cp -r * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
