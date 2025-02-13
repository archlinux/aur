# Maintainer: Dominicentek <dominicentekgaming@gmail.com>
pkgname=saturn-studio
pkgver=1.6.2.3
pkgrel=1
pkgdesc="A cross-platform SFM-like video editor for Super Mario 64. Fork of Saturn by sm64rise."
arch=('x86_64')
optdepends=('ffmpeg: exporting video files')
depends=('sdl2' 'glew')
makedepends=('gcc' 'make' 'git' 'python3')
source=("https://github.com/Dominicentek/saturn-studio/archive/refs/tags/$pkgver.tar.gz" 'saturn-studio-launcher' 'saturn-studio.desktop')
sha256sums=(
  '0c0d281c179cfe172eeb5e07cb5f9934d52ef321314235d109f3f3029799ee4d'
  'e5a7836fc30e933b9af518b0b88ac281e80cddd4578a3a5f7746ec91704b50c2'
  '0c2e25212f179c6e49cad8b862253f4385a068b47fc5f520ce1634b61a00e9b0'
)

build() {
    cd "$srcdir/saturn-studio-$pkgver"
    make -j$(nproc)
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/share/icons"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/v64saturn/res"
    cp "$srcdir/saturn-studio-$pkgver/build/us_pc/saturn.us.f3dex2e" "$pkgdir/usr/bin/saturn-studio"
    cp "$srcdir/saturn-studio-$pkgver/build/us_pc/libdiscord_game_sdk.so" "$pkgdir/usr/lib"
    cp "$srcdir/saturn-studio-$pkgver/res/studio-linuxicon.png" "$pkgdir/usr/share/icons/saturn-studio.png"
    cp "$srcdir/saturn-studio.desktop" "$pkgdir/usr/share/applications/saturn-studio.desktop"
    cp "$srcdir/saturn-studio-launcher" "$pkgdir/usr/bin/saturn-studio-launcher"
    cp -r "$srcdir/saturn-studio-$pkgver/dynos" "$pkgdir/usr/share/v64saturn/dynos"
    cp -r "$srcdir/saturn-studio-$pkgver/fonts" "$pkgdir/usr/share/v64saturn/fonts"
    chmod +x "$pkgdir/usr/bin/saturn-studio"
    chmod +x "$pkgdir/usr/bin/saturn-studio-launcher"
}
