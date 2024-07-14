pkgname=nzportable-bin
pkgver=2.0.0indev20240711072009
pkgrel=1
scriptver=1.0.3
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'yad')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i686=1
sha256sums_x86_64=('a2490735c40e5ebba80a4d6a3bbb25b810cabb0243445f9d301b8676bd52f2b1'
                   'ad9165bba073da393294f61eb684761b943bc9bd4e86cfb131a693afd94ea633')
sha256sums_i686=('a2490735c40e5ebba80a4d6a3bbb25b810cabb0243445f9d301b8676bd52f2b1'
                 '811e24fe47a41dc3126ee4475f6e0df662fd6a2e522ee8c804140ebff90ebbf2')
sha256sums_aarch64=('a2490735c40e5ebba80a4d6a3bbb25b810cabb0243445f9d301b8676bd52f2b1'
                    '9f6f4213dc32bed1652fc3b3cca168b0242372b60f29588a0dce1982ec41a877')
sha256sums_armv7l=('a2490735c40e5ebba80a4d6a3bbb25b810cabb0243445f9d301b8676bd52f2b1'
                   '005dc6674fb9c2e9287286b83624076f85cb481437ba491d8a0f60efa9d355e6')
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
