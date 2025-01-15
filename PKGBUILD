pkgname=2s2h-bin
pkgver=1.1.2
pkgrel=2
scriptver=1.0.4
pkgdesc="An unofficial port of The Legend of Zelda Majora's Mask Binary package"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/2s2h"
license=('GPL')
depends=('tinyxml2' 'sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums=('097756d12a430c7dfb1a00037bb82de4f7b346fdfa6138c298223cb3b134e4e2')
sha256sums_x86_64=('c4fbe761b355138526df526f3d2f5edb1236baaff5958f73a906f9d127051f3a')
sha256sums_aarch64=('8e5a80fe4b2793b419311eb0eea72111f3e4a4efa1c9a922a0a4ea9c0df175a9')
sha256sums_i686=('ff3930264b5d32fa5c4770df1fa2f28ac9196c29cb4013c0853e0c419d7ff774')
source=("https://gitlab.com/linuxbombay/2s2h/2s2h/-/archive/$scriptver/2s2h-$scriptver.tar.bz2")                 
source_x86_64=("2s2h-$pkgver-linux-x64.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-x64.tar.xz")
source_aarch64=("2s2h-$pkgver-linux-arm64.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-arm64.tar.xz")
source_i686=("2s2h-$pkgver-linux-i686.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/games/2s2h"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "2s2h" -o -name "*.o2r" \) -exec cp -r {} "$pkgdir/usr/share/games/2s2h" \;
    #Lib fix only applies for Arm64
    if [ -d "$srcdir/usr/lib" ]; then
     find "$srcdir/usr/lib" -type f \( -name "*.so.10" -o -name "*.so.10.2.0" -o -name "*.libspdlog.so.1.13" -o -name "*.libspdlog.so.1.13.0" \) -exec bash -c 'test ! -e /usr/lib/$(basename {}) && cp -r {} "$pkgdir/usr/lib"' \;
    fi
    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/2s2h"
    install -Dm755 "$srcdir/2s2h-$scriptver/2s2h.sh" "$pkgdir/usr/bin/2s2h"
    install -Dm644 "$srcdir/2s2h-$scriptver/2s2h.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/2s2h-$scriptver/2s2h.desktop" "$pkgdir/usr/share/applications"
}
