pkgname=ruffle-bin
pkgver=2024.04.19
pkgrel=1
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
sha256sums_i386=('91f03283c15b04c5aafd697914b13618a4d92d355463e95624ef97fd58080b4a'
                 'cee3e631a02d3513f5f5bdb89fbf7794571ae9c8a6d8c339bf0293e397131c41')
sha256sums_pentium4=('91f03283c15b04c5aafd697914b13618a4d92d355463e95624ef97fd58080b4a'
                     'cee3e631a02d3513f5f5bdb89fbf7794571ae9c8a6d8c339bf0293e397131c41')
sha256sums_i686=('91f03283c15b04c5aafd697914b13618a4d92d355463e95624ef97fd58080b4a'
                 'cee3e631a02d3513f5f5bdb89fbf7794571ae9c8a6d8c339bf0293e397131c41')
sha256sums_x86_64=('f023720c38d8aec709efd345336336e88faa9ae5f9228fc5c113b2d004afb4e6'
                   'cee3e631a02d3513f5f5bdb89fbf7794571ae9c8a6d8c339bf0293e397131c41')
sha256sums_aarch64=('619851ace3eb74acc2327f66677de37e84a4cb89749ab379a31df318777f81a8'
                    'cee3e631a02d3513f5f5bdb89fbf7794571ae9c8a6d8c339bf0293e397131c41')
source_x86_64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-x64.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

source_i386=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

source_pentium4=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

source_i686=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-i686.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

source_aarch64=("https://gitlab.com/linuxbombay/ruffle-linux/binaries/ruffle-$pkgver/-/raw/main/ruffle-arm64.tar.xz" 
"https://gitlab.com/linuxbombay/ruffle-linux/ruffle/-/archive/ruffle-$pkgver/ruffle-$pkgver.tar.bz2")

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
