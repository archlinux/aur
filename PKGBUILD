pkgname=nzportable-bin
pkgver=2.0.0indev20241231072102
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
                   '205be12efbc846c6e6d6da849e39153e28f49a9c9f809173aa9db5a9a1a693ad')
sha256sums_i686=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                 'f41fc0db31a49e2c90770f160ba318ec7f12a5894367cbcabd29c970dbbc41c8')
sha256sums_aarch64=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                    '78b846e91dae00bc6b106fc126ddc2dfbb5d8669f0db6380fd0ca8dff5412932')
sha256sums_armv7l=('63618827047a5045b1f8e26db28a44868ce50c12e5662cca8d646bace08d2ba0'
                   '6d071043520c0ace0b66e2ba33397308685829ba6430e87e3d2a830a643e1fe2')
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
