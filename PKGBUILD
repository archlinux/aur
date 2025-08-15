# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=cryptura
pkgver=2.1
pkgrel=1
pkgdesc="A lightweight cross platform password manager"
arch=('x86_64')
url="https://code.weexnes.dev/Cryptura"
license=('GPL3')
makedepends=('dotnet-sdk')
depends=()
options=('!strip')

source=("${pkgname}-${pkgver}.tar.gz::https://code.weexnes.dev/~downloads/projects/14/archives?revision=refs/tags/${pkgver}&format=tgz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Cryptura"
  dotnet publish ./Cryptura.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true \
    -o "$srcdir/output_linux"
}

package() {
  install -Dm755 "$srcdir/output_linux/Cryptura" "$pkgdir/usr/bin/cryptura"
  install -Dm644 "$srcdir/output_linux/libHarfBuzzSharp.so" "$pkgdir/usr/lib/libHarfBuzzSharp.so"
  install -Dm644 "$srcdir/output_linux/libSkiaSharp.so" "$pkgdir/usr/lib/libSkiaSharp.so"
}
