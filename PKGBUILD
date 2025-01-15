pkgname=soh-bin
pkgver=8.0.6
pkgrel=4
scriptver=1.0.0
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/soh"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip' 'zenity' 'tinyxml2')
makedepends=('unzip')
sha256sums=('59dabfcc0744b2b727d704d4ec5fb63f68f874d2db3a5600495f7d6f3b75c6d4')
sha256sums_i686=('05d489e704334046e6f192557078747cdb5ac8bcb715cc6b97d60d21e621e90b')
sha256sums_x86_64=('599a7cfe742155995a3b88497a4189db00485abf5f14df92fb7ab802513ed224')
sha256sums_aarch64=('5682c3eab8fb5bd12cd99bd6933f212f8d724f034807effcf2c4d2fe80ce7bbd')
source=("https://gitlab.com/linuxbombay/soh/shipwright/-/archive/$scriptver/shipwright-$scriptver.tar.bz2")
source_i686=("soh-$pkgver-linux-i686.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/soh-linux-i686.tar.xz")
source_x86_64=("soh-$pkgver-linux-x64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/soh-linux-x64.tar.xz")
source_aarch64=("soh-$pkgver-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/soh/binaries/$pkgver/-/raw/main/soh-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/games/Shipwright"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "soh" -o -name "*.ini" -o -name "*.json" -o -name "*.otr" \) -exec cp -r {} "$pkgdir/usr/share/games/Shipwright" \;
    find "$srcdir/usr/lib" -type f \(  -name "*.so.10" -o -name "*.so.10.2.0" -o -name "*.libspdlog.so.1.13" -o -name "*.libspdlog.so.1.13.0" \) -exec bash -c 'test ! -e /usr/lib/$(basename {}) && cp -r {} "$pkgdir/usr/lib"' \;
    cp -r "$srcdir/assets" "$pkgdir/usr/share/games/Shipwright"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.sh" "$pkgdir/usr/bin/soh"
    install -Dm644 "$srcdir/shipwright-$scriptver/soh.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/shipwright-$scriptver/soh.desktop" "$pkgdir/usr/share/applications"
}
