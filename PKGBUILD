# Maintainer: raindropqwq <raindropqwq@outlook.com>
# Maintainer: snowdropQwQ <xpecnh2n@gmail.com>

pkgname=micyou-bin
_pkgver=1.1.2-20260223-0254
pkgver=1.1.2
pkgrel=1
pkgdesc="Turn your Android device into a high-quality wireless microphone for your PC"
arch=('x86_64')
url="https://github.com/LanRhyme/MicYou"
license=('MIT')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'glibc' 'libappindicator' 'libgl' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
optdepends=(
    'bluez-libs: Bluetooth connectivity support'
    'xdg-utils: Open URLs in default browser'
)
provides=('micyou')
conflicts=('micyou')
options=('!strip')
source=("https://github.com/LanRhyme/MicYou/releases/download/v${_pkgver}/MicYou-Linux-${pkgver}.deb")
sha256sums=('838ad224a267e66125a521e85657fae2b10a7a4052ab78f1044e59659e76bb2e')
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
