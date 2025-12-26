pkgname=spaghettikart-bin
pkgver=0.9.9.1.libpatch
pkgrel=1
scriptver=1.1
rlname=SpaghettiKart
_rlname=spaghettikart
pkgdesc="Spaghetti Kart Reimplimentation engine for Mario Kart 64"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/spaghettikart"
license=('GPL')
depends=('sdl2' 'libpng' 'libzip' 'nlohmann-json' 'tinyxml2' 'spdlog' 'sdl2_net' 'boost' 'libogg' 'libvorbis' 'zenity')
makedepends=('unzip')
sha256sums=('380655e827c5750a1641cc318277af650d927045a5746fd915cccdc89eab7b4d')
sha256sums_x86_64=('dbbb389f2f79b430d67c773b1259484ee3629ada46b1de5d82e32953e032ebb1')
sha256sums_aarch64=('d484b358c2e83c23c6a8d783f39e4d631d3fc71d1c74cf781300987d822ea8d4')
source=("https://gitlab.com/linuxbombay/spaghettikart/spaghettikart/-/archive/$scriptver/spaghettikart-$scriptver.tar.bz2")
source_x86_64=("spaghettikart-$pkgver-linux-x64.tar.xz::https://gitlab.com/linuxbombay/spaghettikart/binaries/$pkgver/-/raw/main/spaghettikart-linux-x64.tar.xz")
source_aarch64=("spaghettikart-$pkgver-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/spaghettikart/binaries/$pkgver/-/raw/main/spaghettikart-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/$rlname"
    install -dm755 "$pkgdir/usr/share/games/$rlname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    
    find "$srcdir" -type f \( -name "Spaghettify" -o -name "*.ini" -o -name "spaghettify.cfg.json" -o -name "spaghetti.o2r" -o -name "config.yml" -o -name "torch.hash.yml" \) -exec cp -rf {} "$pkgdir/usr/share/games/$rlname" \;
    cp -r "$srcdir/torch" "$pkgdir/usr/share/games/$rlname"
    cp -r "$srcdir/yamls" "$pkgdir/usr/share/games/$rlname"
    install -Dm755 "$srcdir/$_rlname-$scriptver/$_rlname" "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$_rlname-$scriptver/$_rlname.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/$_rlname-$scriptver/$_rlname.desktop" "$pkgdir/usr/share/applications"
    
    #libs
    find "$srcdir/usr/lib/SpaghettiKart" -name "*.so*" -exec cp -a {} "$pkgdir/usr/lib/$rlname" \;
}
