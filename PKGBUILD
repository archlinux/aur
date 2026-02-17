# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=micyou-bin
_pkgver=1.1.0-20260216-1523
pkgver=1.1.0
pkgrel=2
pkgdesc="Turn your Android device into a high-quality wireless microphone for your PC"
arch=('x86_64')
url="https://github.com/LanRhyme/MicYou"
license=('MIT')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'glibc' 'libappindicator' 'libgl' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
provides=('micyou')
conflicts=('micyou')
options=('!strip')
source=("https://github.com/LanRhyme/MicYou/releases/download/v${_pkgver}/MicYou-Linux-${pkgver}.deb")
sha256sums=('52170c76c8a4c325acebac794749f456332bebab5fa5e9525468132d3b028815')
noextract=("MicYou-Linux-${pkgver}.deb")

package() {
    cd "$srcdir"
    
    # Extract deb
    bsdtar -xf MicYou-Linux-${pkgver}.deb
    bsdtar -xf data.tar.zst -C "$pkgdir"
    
    # Install desktop file
    install -Dm644 "$pkgdir/opt/micyou/lib/micyou-MicYou.desktop" "$pkgdir/usr/share/applications/micyou.desktop"
    
    # Install icon
    install -Dm644 "$pkgdir/opt/micyou/lib/MicYou.png" "$pkgdir/usr/share/pixmaps/micyou.png"

    # Create Symlink for command line execution
    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/micyou/bin/MicYou" "$pkgdir/usr/bin/MicYou"
    
}
