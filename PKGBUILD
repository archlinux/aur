pkgname=nzportable-bin
pkgver=2.0.0indev20241013071909
pkgrel=1
scriptver=1.0.5
pkgdesc='Nazi Zombies: Portable, a Call of Duty: Zombies "de-make" powered by various enhanced forks of the Quake engine'
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://gitlab.com/linuxbombay/nzp"
license=('GPL2')
depends=('sdl2' 'yad')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i686=1
sha256sums_x86_64=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                   '3b7d89a4889d44a0ac5d727987c4db4367c8dc00736b157d195c4157336aca9b')
sha256sums_i686=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                 '7611e341adb46eeab5ebccc26e0b8dea733016b16ece76fa5f36f4bb76597151')
sha256sums_aarch64=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                    'f5e98ef0bd852910cdd4f2224e518abba8c6d5265aec6f5fd6670febc3a7079d')
sha256sums_armv7l=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                   'c9290e7462f32cd9337adc9d596e9a065b96bd12d592d715ceb9ed3459544c34')
source_x86_64=(
"https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" 
"nzportable-linux64-$pkgver.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux64.zip")

source_aarch64=(
"https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" 
"nzportable-linuxarm64-$pkgver.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarm64.zip")

source_armv7l=(
"https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" 
"nzportable-linuxarmhf-$pkgver.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linuxarmhf.zip")

source_i686=(
"https://gitlab.com/linuxbombay/nzp/nzp-packaging/-/archive/$scriptver/nzp-packaging-$scriptver.tar.bz2" 
"nzportable-linux32-$pkgver.zip::https://gitlab.com/linuxbombay/nzp/binaries/$pkgver/-/raw/main/nzportable-linux32.zip")

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
