# Maintainer: Yakov Till <yakov.till at gmail dot com>

pkgname=sigil-wad
pkgver=1.2
pkgrel=1

url="https://romero.com/sigil"
pkgdesc="SIGIL, the unofficial 5th episode of the original 1993 DOOM by John Romero. Requires DOOM.WAD"
license=('custom')

arch=('any')
makedepends=('unzip')
_filever="${pkgver//./_}"
source=("https://romero.com/s/SIGIL_V${_filever}.zip"
        "https://images.squarespace-cdn.com/content/v1/5fef3318f8ce9b562500206e/1609621243192-JXVMK6DO7545JVZIRLM3/logo-sigil.png"
        "sigil.desktop"
        "sigil_compat.desktop")

sha256sums=('e0d473d0d830c4904cdde0c64bcc2e5648eb6775781f8642a1eae6ed7b451e0c'
            '0e577afac4cd598a501e445d2abe58285b01f9f2c8fbdad99cb83ab880306c61'
            '37ea66ee77f07b64ec8646ee6ca761be6c1d63719ec3e7106abc902c97391abd'
            '7d5c26f36b43a90abf76d22da762303aff166bd85d5e3d141dcaa09bbc348523')

package() {
    mkdir -p "$pkgdir/usr/share/doom"
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$pkgdir/usr/share/games/sigil"
    
    install -Dm644 "SIGIL_v1_2.txt" "$pkgdir/usr/share/doc/$pkgname/instructions.txt"
    install -Dm644 "SIGIL_v${_filever}.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 "SIGIL_v${_filever}.wad" "$pkgdir/usr/share/games/sigil/sigil.wad"
    install -Dm644 "SIGIL_COMPAT_v${_filever}.wad" "$pkgdir/usr/share/games/sigil/sigil_compat.wad"
    ln -s /usr/share/games/sigil/sigil.wad "$pkgdir/usr/share/doom/sigil.wad"
    ln -s /usr/share/games/sigil/sigil_compat.wad "$pkgdir/usr/share/doom/sigil_compat.wad"

    cd "$srcdir"
    install -Dm644 "logo-sigil.png" "$pkgdir/usr/share/pixmaps/sigil.png"
    install -Dm644 "sigil.desktop" "$pkgdir/usr/share/applications/sigil.desktop"
    install -Dm644 "sigil_compat.desktop" "$pkgdir/usr/share/applications/sigil_compat.desktop"
}