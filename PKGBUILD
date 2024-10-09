pkgname=nzportable-bin
pkgver=2.0.0indev20241006072024
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
                   '044fb25f7aaec8f041839d9c29e5acf51ee8185f2b0ffb88f0aa858a3dbf3937')
sha256sums_i686=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                 '8fc2a9b9119f4bd81169ba4058cefcc62252bcfd048556a7a42f84625927bd05')
sha256sums_aarch64=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                    '3d286a05ebf3bb6f0b1505959c30e8ac9310503cd872b3e7e2b8e278bb4519e0')
sha256sums_armv7l=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                   'ead40a0d27f825138f9c60108873da2592281070906fd41cf68cf62d221feec8')
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
