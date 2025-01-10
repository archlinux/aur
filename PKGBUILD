pkgname=nestris-bin
pkgver=0.7
pkgrel=4
scriptver=1.0.0
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Tetris NES powered by the Nestris reimplimentation engine."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/nestris"
license=('GPL')
depends=('sdl2' 'sdl_image' 'sdl_mixer' 'yaml-cpp')
makedepends=('unzip')
sha256sums_x86_64=('9b0f734616c9f7c8768b713e1ca286719ea73cf376d2bc755f236edce13d29ad'
                   '75f054607edc9fc38f0ebcba2274499124070c9252f0dbabd25be3430dba68e9')
sha256sums_aarch64=('5c1db080e8546d06da8b810d2c0c9a14ab35a331acfe67d52811b990ef1ef1ea'
                    '75f054607edc9fc38f0ebcba2274499124070c9252f0dbabd25be3430dba68e9')
source_x86_64=("https://gitlab.com/linuxbombay/nestris/binaries/$pkgver/-/raw/main/nestris-linux-x64.tar.xz"
"https://gitlab.com/linuxbombay/nestris/nestris/-/archive/$scriptver/nestris-$scriptver.tar.bz2")
source_aarch64=("https://gitlab.com/linuxbombay/nestris/binaries/$pkgver/-/raw/main/nestris-linux-arm64.tar.xz"
"https://gitlab.com/linuxbombay/nestris/nestris/-/archive/$scriptver/nestris-$scriptver.tar.bz2")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/games/Nestris"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cd $srcdir
    for dir in nestris-$scriptver ; do mv "${dir}" "nestrispkg" ;done
    install -Dm755 "$srcdir/nestrispkg/nestris.sh" "$pkgdir/usr/bin/nestris"
    cp -r "$srcdir/nestrispkg/nestris.svg" "$pkgdir/usr/share/pixmaps"
    cp -r "$srcdir/nestrispkg/nestris.png" "$pkgdir/usr/share/games/Nestris"
    install -Dm755 "$srcdir/nestris" "$pkgdir/usr/share/games/Nestris"
    install -Dm755 "$srcdir/nestrispkg/nestris.desktop" "$pkgdir/usr/share/applications"
}
