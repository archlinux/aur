pkgname=ruffle-bin
pkgver=2024.01.22
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_i668=1
_pkgrel_aarch64=1
pkgdesc="Unnofficial Ruffle bin package that supplies binaries for Linux x64, i368 and Arm64"
arch=('i386' 'i686' 'x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(gtk3 libxcb zlib libxcb alsa-lib)
makedepends=('unzip')
conflicts=(ruffle-git)
makedepends=('unzip')
sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_i386=('SKIP' 'SKIP')
sha256sums_i686=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')
source_x86_64=("https://gitlab.com/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-$pkgver-x64.tar.xz" "https://gitlab.com/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-ruffle-$pkgver.tar.bz2")
source_i386=("https://gitlab.com/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-$pkgver-i386.tar.xz" "https://gitlab.com/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-ruffle-$pkgver.tar.bz2")
source_i686=("https://gitlab.com/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-$pkgver-i686.tar.xz" "https://gitlab.com/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-ruffle-$pkgver.tar.bz2")
source_aarch64=("https://gitlab.com/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-$pkgver-arm64.tar.xz" "https://gitlab.com/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-ruffle-$pkgver.tar.bz2")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    for dir in ruffle-*/ ; do mv "${dir}" "$pkgname" ;done   

    # Link to binary
    cp "$srcdir/ruffle" "$pkgdir/usr/bin"
    
    # Desktop Entry
    cp -r "$srcdir/$pkgname/ruffle.svg" "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$srcdir/$pkgname/ruffle.desktop" \
    "$pkgdir/usr/share/applications/ruffle.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ruffle.desktop"
}
