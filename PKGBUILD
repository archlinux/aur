pkgname=nzportable-bin
pkgver=2.0.0indev20240915071841
pkgrel=1
scriptver=1.0.4
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'yad')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i686=1
sha256sums_x86_64=('dc85de0919b61913a140566c66b292cfa26ffd9e5db7835e2a19fc2ad5b6ffd2'
                   '9fd317e570d27d82d1d2293445409f0f2d90ed0a5b6155aa055158f0b08e1a0e')
sha256sums_i686=('dc85de0919b61913a140566c66b292cfa26ffd9e5db7835e2a19fc2ad5b6ffd2'
                 'f800728c4b67a8360c9d919c730071cfe8d20af04e3381c101fe7c28647dd2ed')
sha256sums_aarch64=('dc85de0919b61913a140566c66b292cfa26ffd9e5db7835e2a19fc2ad5b6ffd2'
                    '8060893b234a9d98a1791e4ee9c8b4791b5aaaaf710b19f784872747f50b2e2f')
sha256sums_armv7l=('dc85de0919b61913a140566c66b292cfa26ffd9e5db7835e2a19fc2ad5b6ffd2'
                   '7f195d4391d984286b94bb796048b952f7abfb716deae57cfb8660ee198b12ae')
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
    rm -rf $srcdir/nzp/user_settings.cfg
    find . -type f -name "*nzportable*" -exec sh -c 'mv "$0" "${0%/*}/nzportable"' {} \;
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
