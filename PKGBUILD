pkgname=ruffle-bin
pkgver=2024.09.19
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
sha256sums_i386=('b69dea62bcbfa97e7bb29fb3c9b8441272e0407eb7a83af6ad101746f3ccbf0a'
                 'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_pentium4=('b69dea62bcbfa97e7bb29fb3c9b8441272e0407eb7a83af6ad101746f3ccbf0a'
                     'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_i686=('b69dea62bcbfa97e7bb29fb3c9b8441272e0407eb7a83af6ad101746f3ccbf0a'
                 'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_x86_64=('33cf3266b3eb231b4d3128ff89a21489ae5b9e115615acb52338314320439f42'
                   'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
sha256sums_aarch64=('72f534d1f62952381005a2e38094e0b750c928dbe472cc31da5e3e631422da77'
                    'f043303d00abda09e5f23823cd9211b16b9448ac81f87b3c609e7158d4ef5920')
source_x86_64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-x64.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_i386=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_pentium4=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_i686=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle-packaging/-/archive/$scriptver/ruffle-packaging-$scriptver.tar.bz2")

source_aarch64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-arm64.tar.xz" 
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
