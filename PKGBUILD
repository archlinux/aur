# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>

_pkgname=nwjs
pkgname=$_pkgname-nightly-bin
pkgver=20170315
_pkgver=0.21.2
pkgrel=1
pkgdesc="node-webkit is an app runtime based on Chromium and node.js."
arch=("i686" "x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("alsa-lib" "gconf" "gtk2" "nss" "ttf-font" "libxtst" "libxss")
optdepends=(
    "nodejs: npm package support"
    "nw-gyp: native add-on build tool for node-webkit"
)
provides=("node-webkit" "nwjs" "nwjs-bin")
replaces=("node-webkit" "nwjs-bin" "nwjs")
conflicts=("node-webkit" "nwjs" "nwjs-bin")

if [ "$CARCH" = "i686" ]; then
  _arch="ia32"
fi
if [ "$CARCH" = "x86_64" ]; then
  _arch="x64"
fi

source_common="https://dl.nwjs.io/live-build/03-15-2017/nw21-6388aaa-d7e4cbf-96303a2-f8653cb/v${_pkgver}/${_pkgname}-v${_pkgver}-linux"
source_i686=("$source_common-ia32.tar.gz")
source_x86_64=("$source_common-x64.tar.gz")
sha512sums_i686=('19603e886cd5dcbcaafdf3f1d33fbd9d19eed62b204663944727f604c3135ddbdb6f18b0796447e51b96a32400d0401315733d964c9374cb613ab4ffa1910378')
sha512sums_x86_64=('f6c1db57415de291408c33054b0bebc1d13ff33e4bf4a31b1611d1c0017dcbb5b778190c05c9e09bb0b36b58a4e09979b2c885f719ddc22c601a1e24ce434a0e')


package() {
  cd "$srcdir/$_pkgname-v$_pkgver-linux-$_arch"
  install -Ddm755 "$pkgdir/opt/$_pkgname"
  install -Ddm755 "$pkgdir/usr/bin"
  chmod -R +r *
  chmod +x nw lib lib/lib{ffmpeg,node,nw}.so locales
  cp -r * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
