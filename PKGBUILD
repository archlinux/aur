pkgname=2s2h-bin
pkgver=1.0.2
pkgrel=1
scriptver=1.0.3
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="An unofficial port of The Legend of Zelda Majora's Mask Binary package"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/2s2h"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums_x86_64=('4cdc9498865849b6a62d9803247052e2ceee0a29bf1fcd6db5963d9ce92b0a66'
                   '19d22d63b3e9786051b92f2c2caa8985ae0655eebde1c71b32a6aa4993bbf600')
sha256sums_aarch64=('4cdc9498865849b6a62d9803247052e2ceee0a29bf1fcd6db5963d9ce92b0a66'
                    '5d0dcfd3c2565cb47e8a13441d11891d3de657820c31ab5173e27bf7e809971e')
sha256sums_i686=('4cdc9498865849b6a62d9803247052e2ceee0a29bf1fcd6db5963d9ce92b0a66'
                 '60dce994593c359b5d2f7d49733bffa035a523e5c8eaf7caa49ad7ed8f44bf64')
source_x86_64=("https://gitlab.com/linuxbombay/2s2h/2s2h-pkg/-/archive/$scriptver/2s2h-pkg-$scriptver.tar.bz2" "$url/binaries/$pkgver/-/raw/main/2s2h-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/2s2h/2s2h-pkg/-/archive/$scriptver/2s2h-pkg-$scriptver.tar.bz2" "$url/binaries/$pkgver/-/raw/main/2s2h-linux-arm64.tar.xz")
source_i686=("https://gitlab.com/linuxbombay/2s2h/2s2h-pkg/-/archive/$scriptver/2s2h-pkg-$scriptver.tar.bz2" "$url/binaries/$pkgver/-/raw/main/2s2h-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/2s2h"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "2s2h" -o -name '*.o2r' \) -exec cp -r {} "$pkgdir/usr/share/games/2s2h" \;
    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/2s2h"
    install -Dm755 "$srcdir/2s2h-pkg-$scriptver/2s2hIcon.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/2s2h-pkg-$scriptver/2s2h.sh" "$pkgdir/usr/bin/2s2h"

    # Desktop Entry
    install -Dm644 "$srcdir/2s2h-pkg-$scriptver/2s2h.desktop" \
    "$pkgdir/usr/share/applications/2s2h.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/2s2h.desktop"
}
