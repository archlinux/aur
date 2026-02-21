pkgname=2s2h-bin
pkgver=4.0.0
pkgrel=1
scriptver=1.7
pkgdesc="An unofficial port of The Legend of Zelda Majora's Mask Binary package"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/2s2h"
license=('GPL')
depends=('tinyxml2' 'sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums=('115f4df401b0dac585d06b4b59d4d293f0883a69a1b06707c44ab981caff63a8')
sha256sums_x86_64=('d989cdff1542d3c0d4524bd4327411a09796adefc0a8d3bf88b7d8339d4eb25a')
sha256sums_aarch64=('35df284d853495d5bc582b0df69142c7e94d766ed6a486012003b95fa33097cc')
source=("https://gitlab.com/linuxbombay/2s2h/2s2h/-/archive/$scriptver/2s2h-$scriptver.tar.bz2")                 
source_x86_64=("2s2h-$pkgver-linux-x64.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-x64.tar.xz")
source_aarch64=("2s2h-$pkgver-linux-arm64.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/2s2h"
    install -dm755 "$pkgdir/usr/share/games/2s2h"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "2s2h" -o -name "*.o2r" \) -exec cp -r {} "$pkgdir/usr/share/games/2s2h" \;
    #Lib fix to avoid updated lib issues in the future
    find "$srcdir" -type f \( -name ".so" -o -name "*.so.*" \) -exec cp -r {} "$pkgdir/usr/lib/2s2h" \;

    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/2s2h"
    install -Dm755 "$srcdir/2s2h-$scriptver/2s2h.sh" "$pkgdir/usr/bin/2s2h"
    install -Dm644 "$srcdir/2s2h-$scriptver/2s2h.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/2s2h-$scriptver/2s2h.desktop" "$pkgdir/usr/share/applications"
}
