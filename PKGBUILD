pkgname="awww-bin"
pkgver=0.11.2
pkgrel=1
pkgdesc="Pre-compiled binary of awww, wallpaper daemon for Wayland"
arch=(x86_64)
url="https://codeberg.org/LGFae/awww"
license=(GPL-3.0-or-later)
depends=(libxkbcommon lz4)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=(swww)
options=(!lto)
source=( "awww-$pkgver-x86_64.tar.gz::https://github.com/IncogCyberpunk/awww-bin/releases/download/v$pkgver/awww-$pkgver-x86_64.tar.gz")

sha256sums=('57a0e1164ea7cde1393af4b35d802d0b8dbcde4f831fb62e3e48187527803eaa')


package(){
    cd "$srcdir"

    # Install the `awww` and the `awww-daemon` binaries
    install -Dm755 usr/bin/awww "$pkgdir/usr/bin/awww"
    install -Dm755 usr/bin/awww-daemon "$pkgdir/usr/bin/awww-daemon"

    # Install man pages if it exists
    if [ -d usr/share/man/man1 ]; then
        for manPage in usr/share/man/man1/* ; do
            install -Dm644 "$manPage" "$pkgdir/$manPage"
        done
    fi
}
