# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=ps2_manager-git
_commit=239a3dd7dd36837d711f3fa74bf06c264da72072
pkgver=1.5.3.r${_commit:0:7}
pkgrel=1
pkgdesc="A game manager for Open PS2 Loader (OPL) (cutting-edge version)"
arch=('x86_64')
url="https://code.weexnes.dev/ps2_manager"
license=('GPL3')
makedepends=('dotnet-sdk')
depends=()
options=('!strip')
source=("${pkgname}-${_commit}.tar.gz::https://code.weexnes.dev/~downloads/projects/18/archives?revision=${_commit}&format=tgz")
sha256sums=('SKIP')

provides=('ps2_manager')
conflicts=('ps2_manager')

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
