pkgname=ruffle-bin
pkgver=2024.10.19
pkgrel=1
scriptver=1.0.2
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_i668=1
_pkgrel_pentium4=1
_pkgrel_aarch64=1
pkgdesc="Unnofficial Ruffle bin package that supplies binaries for Linux x64, i368 and Arm64"
arch=('i386' 'pentium4' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/ruffle-linux"
license=('Apache' 'MIT')
depends=('gtk3' 'libxcb' 'zlib' 'libxcb' 'alsa-lib' 'libxkbcommon-x11')
makedepends=('unzip')
conflicts=(ruffle-git)
sha256sums_i386=('800128fb369ebb30cf3d9c7e7b48b83d8c8603f273fb46808d8e5444edd2aba3'
                 'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_pentium4=('800128fb369ebb30cf3d9c7e7b48b83d8c8603f273fb46808d8e5444edd2aba3'
                     'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_i686=('800128fb369ebb30cf3d9c7e7b48b83d8c8603f273fb46808d8e5444edd2aba3'
                 'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_x86_64=('38b47f48d746800562ae36460c124874e79070284b3f6f9deaf4f9bc45759ce8'
                   'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_aarch64=('41552ec720f0c8db153ac5ce28a5070d5334941fc305e8c94e6cee9b84d0e7dc'
                    'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
source_x86_64=("ruffle-$pkgver-x64.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-x64.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_i386=("ruffle-$pkgver-i686.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_pentium4=("ruffle-$pkgver-i686.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_i686=("ruffle-$pkgver-i686.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_aarch64=("ruffle-$pkgver-arm64.tar.xz::https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-arm64.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/lib"
    
    for dir in $srcdir/ruffle-packaging-* ; do mv "${dir}" "ruffle-packaging" ;done
    # Link to binary
    install -Dm755 "$srcdir/ruffle" "$pkgdir/usr/bin"
    find "$srcdir" -type f -name "libopenh264-*.so" -exec mv {} "$pkgdir/usr/lib" \;

    # Desktop Entry
    cp -r "$srcdir/ruffle-packaging/ruffle.svg" "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$srcdir/ruffle-packaging/ruffle.desktop" \
    "$pkgdir/usr/share/applications/ruffle.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/ruffle.desktop"
}
