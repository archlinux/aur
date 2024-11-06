pkgname=nzportable-bin
pkgver=2.0.0indev20241104072204
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
                   'da22ad502c22a36bd0c0165873ec7222a0228a2338b4cb1a281ec36871f28c2a')
sha256sums_i686=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                 '5f5b50e7418df6f685ee3c715fec8e63f536383e8eb6218fc678475d5a8335f6')
sha256sums_aarch64=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                    'dd93eff60fd59d316ee21b7dd9d7a36e3128c47b08343fbb36b891f0ae44852b')
sha256sums_armv7l=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                   '4ffbb8d0dd6a0ae53672df775d1a52915ccdbb8d3947ce759c29b203c3267ed6')
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
