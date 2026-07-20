# Maintainer: Chris Zhang <develop@zcy.moe>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang-bin
pkgver=2026.12.0.1
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64' 'aarch64')
license=('MIT')

case "$CARCH" in
  x86_64)
    _sha256sum='bbd36968b5aefdf91c2ede0d2e131f8b552cba6ed2444da59f1a0bc0bfc6792d'
    ;;
  aarch64)
    _sha256sum='8ad6a8449e18d183aa3b75cb3c8421fd5eb5396ee4b095eba69aec75c022f5d3'
    ;;
esac

source=("$url/releases/download/v$pkgver/slang-$pkgver-linux-$CARCH.tar.gz")
sha256sums=("$_sha256sum")
depends=(glslang)
conflicts=(shader-slang shader-slang-git)
provides=(shader-slang)
options=(!debug)

package() {
  mkdir -p $pkgdir/opt/shader-slang-bin/{bin,lib,include/shader-slang,share/{,licenses/}shader-slang}
  mv bin/{slangc,slangd,slangi,gfx.slang,slang.slang} $pkgdir/opt/shader-slang-bin/bin/
  mv lib/*.so* $pkgdir/opt/shader-slang-bin/lib/
  mv include/*.h $pkgdir/opt/shader-slang-bin/include/shader-slang/
  mv share/doc $pkgdir/opt/shader-slang-bin/share/shader-slang/doc
  mv LICENSE $pkgdir/opt/shader-slang-bin/share/licenses/shader-slang/
}
