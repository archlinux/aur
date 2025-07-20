pkgname=ruffle-bin
pkgver=2025.07.20
pkgrel=1
pkgdesc="Unnofficial Ruffle bin package that supplies binaries for Linux x64, i368 and Arm64"
arch=('x86_64' 'aarch64' 'i386' 'pentium4' 'i686')
url="https://gitlab.com/linuxbombay/ruffle-linux"
license=('Apache' 'MIT')
depends=('gtk3' 'libxcb' 'zlib' 'libxcb' 'alsa-lib' 'libxkbcommon-x11')
makedepends=('unzip')
conflicts=(ruffle-git)
sha256sums=('7670a14a3a9ffd2a231abd9232f09c817b6312b60049175324ec4d374dffc6b8'
            'f5c8c21286d89f26c4f101e317641df02bf1af0529b6ca0897f9cebc3d654d7a')
sha256sums_x86_64=('be6170c1bfbff82e0ab84a02ad524f59f70a242204ffcd87ab2c043296f92f73')
sha256sums_aarch64=('d5e6100b934f22e89ef33240196038ace51ef1c64e06e4fa6e77fde47f1fbd1b')
sha256sums_i386=('b34fbccb42c49620a933ab45b58eb16d005d6b97628fb82fa9779a1f1e5dc92d')
sha256sums_pentium4=('b34fbccb42c49620a933ab45b58eb16d005d6b97628fb82fa9779a1f1e5dc92d')
sha256sums_i686=('b34fbccb42c49620a933ab45b58eb16d005d6b97628fb82fa9779a1f1e5dc92d')
source=("ruffle.desktop" "ruffle.svg")
source_x86_64=("ruffle-$pkgver-x64.tar.xz::https://github.com/ruffle-rs/ruffle/releases/download/nightly-${pkgver//./-}/ruffle-nightly-${pkgver//./_}-linux-x86_64.tar.gz")
source_aarch64=("ruffle-$pkgver-arm64.tar.xz::https://github.com/ruffle-rs/ruffle/releases/download/nightly-${pkgver//./-}/ruffle-nightly-${pkgver//./_}-linux-aarch64.tar.gz")
source_i386=("ruffle-$pkgver-i686.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz")
source_pentium4=("ruffle-$pkgver-i686.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz")
source_i686=("ruffle-$pkgver-i686.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"
    
    # Link to binary
    install -Dm755 "$srcdir/ruffle" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/ruffle.svg" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/ruffle.desktop" \
    "$pkgdir/usr/share/applications/ruffle.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ruffle.desktop"
}
