# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
_pkgname=nwjs
pkgname=$_pkgname-bin
pkgver=0.18.7
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
md5sums_i686=('edc06ca20d68dc54df300cebda0e749ade941bb2c34b396f9828703175c1b1570073f423c79ed416ad2750c7506844b0f292c5284d8f66933b90287146f2363f')
sha512sums_x86_64=('63bb05072bb9fb5332243071f3dd75307cb6b6d7fdafd47174c77b3a864f297d377829a1c828a8227b378e8729c91f4f52110d6b8776f4fe71347eaf4782dfb7')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-$_arch"
  install -Ddm755 "$pkgdir/opt/$_pkgname"
  install -Ddm755 "$pkgdir/usr/bin"
  chmod -R +r *
  chmod +x nw lib lib/lib{ffmpeg,node,nw}.so locales
  cp -r * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
