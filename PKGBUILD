# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=micyou-bin
_pkgver=1.0.6hotfix-20260213-1447
pkgver=1.0.6hotfix
pkgrel=3
pkgdesc="Turn your Android device into a high-quality wireless microphone for your PC"
arch=('x86_64')
url="https://github.com/LanRhyme/MicYou"
license=('MIT')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'glibc' 'libgl' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
provides=('micyou')
conflicts=('micyou')
options=('!strip')
source=("https://github.com/LanRhyme/MicYou/releases/download/v${_pkgver}/MicYou-Linux-${pkgver}.deb")
sha256sums=('67bbca1e896c714c713b39fe74941fa41971b58c5701752017a13d96a05cb1b2')
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
    ln -sf "$pkgdir/opt/micyou/bin/MicYou" "$pkgdir/usr/bin/MicYou"
    
}
