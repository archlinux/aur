pkgname=2s2h-bin
pkgver=1.1.2.2
pkgrel=3
scriptver=1.6
pkgdesc="An unofficial port of The Legend of Zelda Majora's Mask Binary package"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/2s2h"
license=('GPL')
depends=('tinyxml2' 'sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2' 'spdlog')
makedepends=('unzip')
sha256sums=('fe780040c4e4764338a79be9600d8b9af3c87798da407b2cb58f58c8d80e4ce6')
sha256sums_x86_64=('a57b583dd21d5f86f327810df3633f16e6fee2eb00eb341acac0c0351555e7ac')
sha256sums_aarch64=('8da815d28d9a7a2c5320424d826b8f27c9dc053f25f029f8f6de0195e24a66a3')
source=("https://gitlab.com/linuxbombay/2s2h/2s2h/-/archive/$scriptver/2s2h-$scriptver.tar.bz2")                 
source_x86_64=("2s2h-$pkgver-linux-x64.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-x64.tar.xz")
source_aarch64=("2s2h-$pkgver-linux-arm64.tar.xz::$url/binaries/$pkgver/-/raw/main/2s2h-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/games/2s2h"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "2s2h" -o -name "*.o2r" \) -exec cp -r {} "$pkgdir/usr/share/games/2s2h" \;
    #Lib fix to avoid updated lib issues in the future
    find "$srcdir" -type f \( -name ".so" -o -name "*.so.*" \) -exec cp -r {} "$pkgdir/usr/share/games/2s2h" \;
    #TintXML2 fix
    if [ ! -f "/usr/lib/libtinyxml2.so.10" ]; then
    ln -s "/usr/lib/libtinyxml2.so" "$pkgdir/usr/lib/libtinyxml2.so.10"
fi

    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/2s2h"
    install -Dm755 "$srcdir/2s2h-$scriptver/2s2h.sh" "$pkgdir/usr/bin/2s2h"
    install -Dm644 "$srcdir/2s2h-$scriptver/2s2h.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/2s2h-$scriptver/2s2h.desktop" "$pkgdir/usr/share/applications"
}
