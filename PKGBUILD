# Maintainer: Yakov Till <yakov.till at gmail dot com>


pkgname=sigil-wad
pkgver=1.0
pkgrel=1

url="https://romero.com/sigil"
pkgdesc="SIGIL, the unofficial 5th episode of the original 1993 DOOM by John Romero. Requires DOOM.WAD."
license=('custom')

arch=('any')
makedepends=('unzip')
_filever="${pkgver//./_}"
source=("https://romero.com/s/SIGIL_V${_filever}.zip"
        "sigil.png"
        "sigil.desktop"
        "sigil_compat.desktop")

sha256sums=('3e2a3945d8cfd5a0a69ccc9b1ea4c2a0ba19efcbbd367d63832586697bc70d88'
            '43511e839b9b852169f4d18d69e88ec9ac92eb05f0382fd4cb7404f4ad9ff0ea'
            '37ea66ee77f07b64ec8646ee6ca761be6c1d63719ec3e7106abc902c97391abd'
            '7d5c26f36b43a90abf76d22da762303aff166bd85d5e3d141dcaa09bbc348523')

package() {
    mkdir -p "$pkgdir/usr/share/doom"
    install -Dm644 "SIGIL_README_V${_filever}.txt" "$pkgdir/usr/share/doc/$pkgname/instructions.txt"
    install -Dm644 "SIGIL_V${_filever}.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 "SIGIL_V${_filever}.wad" "$pkgdir/usr/share/games/sigil/sigil.wad"
    install -Dm644 "SIGIL_COMPAT_V${_filever}.wad" "$pkgdir/usr/share/games/sigil/sigil_compat.wad"
    ln -s /usr/share/games/sigil/sigil.wad "$pkgdir/usr/share/doom/sigil.wad"
    ln -s /usr/share/games/sigil/sigil_compat.wad "$pkgdir/usr/share/doom/sigil_compat.wad"

    cd "$srcdir"
    install -Dm644 "sigil.png" "$pkgdir/usr/share/pixmaps/sigil.png"
    install -Dm644 "sigil.desktop" "$pkgdir/usr/share/applications/sigil.desktop"
    install -Dm644 "sigil_compat.desktop" "$pkgdir/usr/share/applications/sigil_compat.desktop"
}
