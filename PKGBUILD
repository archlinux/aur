# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>

_pkgname=nwjs
pkgname=$_pkgname-bin
pkgver=0.22.0
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
sha512sums_i686=('c28bbf8a07b483452d4640133faca6f9aaa8ec03425d3224ddf9ff498806dbd286f78546444f03680b35def901cb132fb6bc37e916e85ef3e3b80a3868f2de9f')
sha512sums_x86_64=('3493f9f6cdc852f75cb58e183162124a99fa3df26c3674b7a9b10bc3582170906027328c3beb79af8daeadfa4480670426ed8543c25e9fb72f5514a9b6d1713c')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-$_arch"
  install -Ddm755 "$pkgdir/opt/$_pkgname"
  install -Ddm755 "$pkgdir/usr/bin"
  chmod -R +r *
  chmod +x nw lib lib/lib{ffmpeg,node,nw}.so locales
  cp -r * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
