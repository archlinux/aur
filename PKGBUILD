pkgname=2s2h-bin
pkgver=1.0.1
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="An unofficial port of The Legend of Zelda Majora's Mask Binary package"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/2s2h"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums_x86_64=('SKIP'
                   '56b492f3d65c88ef1c3a057f72a558cbcc50f9f87ce17c7ee42edd0fc1a91e9f')
sha256sums_aarch64=('SKIP'
                    '20e7f926f472371ac44ed0298ba72ba47e651bce69521b9677342485cff0e8be')
sha256sums_i686=('SKIP'
                 'c89c88079e4c4d508658405c714d36c00c599ddd525c2e5ac4a3d9dff3d21825')
source_x86_64=("git+https://gitlab.com/linuxbombay/2s2h/2s2h-pkg" "$url/binaries/$pkgver/-/raw/main/2s2h-linux-x64.tar.xz")
source_aarch64=("git+https://gitlab.com/linuxbombay/2s2h/2s2h-pkg" "$url/binaries/$pkgver/-/raw/main/2s2h-linux-arm64.tar.xz")
source_i686=("git+https://gitlab.com/linuxbombay/2s2h/2s2h-pkg" "$url/binaries/$pkgver/-/raw/main/2s2h-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/2s2h"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "2s2h" -o -name '*.o2r' \) -exec cp -r {} "$pkgdir/usr/share/games/2s2h" \;
    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/2s2h"
    install -Dm755 "$srcdir/2s2h-pkg/2s2hIcon.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/2s2h-pkg/2s2h.sh" "$pkgdir/usr/bin/2s2h"

    # Desktop Entry
    install -Dm644 "$srcdir/2s2h-pkg/2s2h.desktop" \
    "$pkgdir/usr/share/applications/2s2h.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/2s2h.desktop"
}
