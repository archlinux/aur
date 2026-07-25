# Maintainer: Chris Zhang <develop@zcy.moe>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang-bin
pkgver=2026.14
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64' 'aarch64')
license=('MIT')

case "$CARCH" in
  x86_64)
    _sha256sum='9445cf0b35332bfda055c9424e307f957ff58befb04c5b45b9f9f29894a41cf8'
    ;;
  aarch64)
    _sha256sum='7acbfe80260009263346f72efaadabfa7666248a045e720b573ba78fb008ac42'
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
