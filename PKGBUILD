# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>

_pkgname=nwjs
pkgname=$_pkgname-nightly-bin
pkgver=0.21.2
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

source_common="https://dl.nwjs.io/live-build/03-14-2017/nw21-6388aaa-482e210-96303a2-f8653cb/v${pkgver}/${_pkgname}-v${pkgver}-linux"
source_i686=("$source_common-ia32.tar.gz")
source_x86_64=("$source_common-x64.tar.gz")
sha512sums_i686=('094d4ccac38a44708cdb110243d6510c9fc73d25e7e4986f5f5c8c7c69688a12e9aa65581ff3be57edf9a6f5c46447d1f0a4a177591a1a2a773c425261001a80')
sha512sums_x86_64=('104bb70875084511663df8c4340b9d65a42970ac0c3a66288dedaf95aa4391950b52ea611b2e868631512fc0b0a7ef22db3187168d776d7a808e5a96143368e0')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-$_arch"
  install -Ddm755 "$pkgdir/opt/$_pkgname"
  install -Ddm755 "$pkgdir/usr/bin"
  chmod -R +r *
  chmod +x nw lib lib/lib{ffmpeg,node,nw}.so locales
  cp -r * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
