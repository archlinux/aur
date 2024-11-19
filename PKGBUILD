pkgname=2s2h-bin
pkgver=1.1.1
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="An unofficial port of The Legend of Zelda Majora's Mask Binary package"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/2s2h"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums=('426dade51206ad165807b879c723b843ee5a52f77f487e52e397ac55db64818f'
            'fed4562951cef826a2cfc99b81e4a91713c65c056112996c99d38c4fd3ce5ce9'
            '7e71a3c899f64ea760c6899e4fc282817d6a989fd976feaec66865958f3819e0')
sha256sums_x86_64=('9ce406022f4eb496d4454ca5d906d89860a662c8463c35932327925c7b3303f3')
sha256sums_aarch64=('9c0c48f1c398b35aee6a5ea917631e73affc11177aa6a94cec18c6d2126cd78e')
sha256sums_i686=('7ec0cd102b7dc70fb772753c2ffeb3fa60d57f2dcadad4a473197997a9b15003')
source=("2s2h.sh" "2s2h.desktop" "2s2h.png")                 
source_x86_64=("$url/binaries/$pkgver/-/raw/main/2s2h-linux-x64.tar.xz")
source_aarch64=("$url/binaries/$pkgver/-/raw/main/2s2h-linux-arm64.tar.xz")
source_i686=("$url/binaries/$pkgver/-/raw/main/2s2h-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/2s2h"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "2s2h" -o -name '*.o2r' \) -exec cp -r {} "$pkgdir/usr/share/games/2s2h" \;
    install -Dm755 "$srcdir/2s2h.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/2s2h.sh" "$pkgdir/usr/bin/2s2h"

    # Desktop Entry
    install -Dm644 "$srcdir/2s2h.desktop" \
    "$pkgdir/usr/share/applications/2s2h.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/2s2h.desktop"
}
