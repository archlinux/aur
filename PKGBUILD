pkgname=2s2h-bin
pkgver=1.0.0
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Ship of Harkinian Reimplimentation engine"
arch=('x86_64' 'aarch64' 'i686')
url="https://gitlab.com/linuxbombay/2s2h"
license=('GPL')
depends=('sdl2' 'sdl2_net' 'libpng' 'libzip')
makedepends=('unzip')
sha256sums_x86_64=('SKIP'
                   '5f3f84281c634289a68a31735ba96bcd9fc64b8147efb8265f368eaf4f7359f8')
sha256sums_aarch64=('SKIP'
                    'a36ac89fd36cb4e19afa1ca902df34081666252dc4bdb2d13a1cd0bebdad5979')
sha256sums_i686=('SKIP'
                 '1e55f16d8400c78f7ce5dafb8447bacdabed4160a32756175af49bc5b0625bf3')
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
