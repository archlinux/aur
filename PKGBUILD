# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=ps2_manager
pkgver=1.4
pkgrel=1
pkgdesc="A game manager for Open PS2 Loader (OPL)"
arch=('x86_64')
url="https://code.weexnes.dev/ps2_manager"
license=('GPL3')
makedepends=('dotnet-sdk')
depends=()
options=('!strip')

source=("${pkgname}-${pkgver}.tar.gz::https://code.weexnes.dev/~downloads/projects/18/archives?revision=refs/tags/${pkgver}&format=tgz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/PS2_Manager"
  dotnet publish ./PS2_Manager.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true \
    -o "$srcdir/output_linux"
}

package() {
  install -Dm755 "$srcdir/output_linux/PS2_Manager" "$pkgdir/usr/bin/ps2_manager"
  install -Dm644 "$srcdir/output_linux/libHarfBuzzSharp.so" "$pkgdir/usr/lib/libHarfBuzzSharp.so"
  install -Dm644 "$srcdir/output_linux/libSkiaSharp.so" "$pkgdir/usr/lib/libSkiaSharp.so"
}
