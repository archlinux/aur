pkgname=spaghettikart-bin
pkgver=1.0.0
pkgrel=2
scriptver=1.2
rlname=SpaghettiKart
_rlname=spaghettikart
pkgdesc="Spaghetti Kart Reimplimentation engine for Mario Kart 64"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/spaghettikart"
license=('GPL')
depends=('sdl2' 'libpng' 'libzip' 'nlohmann-json' 'tinyxml2' 'spdlog' 'sdl2_net' 'boost' 'libogg' 'libvorbis' 'zenity')
makedepends=('unzip')
sha256sums=('5f8b19a2546c16f18e8d836d376f1f3af598b98d1ea559c930a582c9bfcd8747')
sha256sums_x86_64=('f34eac67c941ca5801f865516a249b49419ca7910ec05552c9a4765dcffee02a')
sha256sums_aarch64=('db5c2f545cb7c9a2ac682b88e73a56ae6cb707739e0aeae6a2885655b9f21cbe')
source=("https://gitlab.com/linuxbombay/spaghettikart/spaghettikart/-/archive/$scriptver/spaghettikart-$scriptver.tar.bz2")
source_x86_64=("spaghettikart-$pkgver-linux-x64.tar.xz::https://gitlab.com/linuxbombay/spaghettikart/binaries/$pkgver/-/raw/main/spaghettikart-linux-x64.tar.xz")
source_aarch64=("spaghettikart-$pkgver-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/spaghettikart/binaries/$pkgver/-/raw/main/spaghettikart-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/$rlname"
    install -dm755 "$pkgdir/usr/share/games/$rlname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    for path in "$srcdir"/*; do
        name="${path##*/}"

        case "$name" in
            usr|"$_rlname-$scriptver"|*.tar.*)
                continue
                ;;
        esac

        cp -a "$path" "$pkgdir/usr/share/games/$rlname/"
    done

    install -Dm755 "$srcdir/$_rlname-$scriptver/$_rlname" "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$_rlname-$scriptver/$_rlname.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/$_rlname-$scriptver/$_rlname.desktop" "$pkgdir/usr/share/applications"
    
    #libs
    for libdir in "$srcdir/usr/lib/SpaghettiKart" "$srcdir/usr/lib/Spaghettikart"; do
        [ -d "$libdir" ] || continue
        find "$libdir" -name "*.so*" -exec cp -a {} "$pkgdir/usr/lib/$rlname" \;
    done
}
