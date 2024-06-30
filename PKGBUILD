pkgname=nzportable-bin
pkgver=2.0.0indev20240630071750
pkgrel=1
scriptver=1.0.2
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'yad')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i686=1
sha256sums_x86_64=('257206ab55eef91cd0482d425351a683bd23545cd805ea3bf086b9f4e19a8495'
                   'ed01baf0e9c94eb500c7bb960d79804d428891a2d47b05fe5912bbe3f77556ef')
sha256sums_i686=('257206ab55eef91cd0482d425351a683bd23545cd805ea3bf086b9f4e19a8495'
                 '39a91dd197194f1eaca5ce8b184e7844811e940db85cdacdccd5a08f6381b490')
sha256sums_aarch64=('257206ab55eef91cd0482d425351a683bd23545cd805ea3bf086b9f4e19a8495'
                    '4d7a1d6b5233da3fb7d5d2377c630af800b9f8c9d6de28bb1c32b0bb9248b9e7')
sha256sums_armv7l=('257206ab55eef91cd0482d425351a683bd23545cd805ea3bf086b9f4e19a8495'
                   '35ec420457ebe7283959d6e27b0885c6bac7b56a66fd475b8aeef73c3f3dd091')
source_x86_64=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux64.zip")
source_aarch64=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarm64.zip")
source_armv7l=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarmhf.zip")
source_i686=("https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" "https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux32.zip")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/games/NZP"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cd $srcdir
    find -type f -name "*nzportable*" -exec cp -r {} "nzportable" \;
    install -Dm755 "nzportable" "$pkgdir/usr/share/games/NZP/nzportable"
    cp -r nzp "$pkgdir/usr/share/games/NZP"
    cp -r default.fmf "$pkgdir/usr/share/games/NZP"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp.svg" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/nzp-packaging-$scriptver/nzp-title.png" "$pkgdir/usr/share/games/NZP"
    
    # Link to binary
    install -Dm755 "$srcdir/nzp-packaging-$scriptver/nzp.sh" "$pkgdir/usr/bin/nzp"

    # Desktop Entry
    install -Dm644 "$srcdir/nzp-packaging-$scriptver/nzp.desktop" \
        "$pkgdir/usr/share/applications/nzp.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/nzp.desktop"
}
