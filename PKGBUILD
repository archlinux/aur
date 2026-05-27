# Maintainer: Chris Zhang <develop@zcy.moe>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=shader-slang-bin
pkgver=2026.9.1
pkgrel=1
pkgdesc='Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion'
url='https://github.com/shader-slang/slang'
arch=('x86_64' 'aarch64')
license=('MIT')

case "$CARCH" in
  x86_64)
    _sha256sum='50a134d8a0751dd6ca8d7c40f391f1d62f62daa1eaee3c21428700763045a6b9'
    ;;
  aarch64)
    _sha256sum='9d0c5db8b7f2354151ee8289997f914999bee510da1d7c8a9a540847fd17f793'
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
