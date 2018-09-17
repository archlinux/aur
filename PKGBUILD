# Maintainer: emersion <contact@emersion.fr>
# Contributor: ValdikSS <iam@valdikss.org.ru>

pkgname=osu
pkgver=20170118
pkgrel=2

source=("http://m1.ppy.sh/r/osu!install.exe"
	"directsound-latency.reg"
	"osu.desktop"
	"osulauncher"
	"osu.png")

md5sums=('SKIP'
         '1d285eb3a5bdb6a70da89116dec18441'
         '3cb400cea5e9bff628f89c17a5f33f99'
         '60ee5829b38c43bc30eba7805764f71f'
         'a0289f4f499640bfb3b39bf393140b03')

pkgdesc="Freeware rhythm video game"
url="http://osu.ppy.sh"
arch=(i686 x86_64)
license=(custom)
install=osu.install

depends=(wine winetricks)
depends_x86_64=(lib32-alsa-lib lib32-gnutls)

package() {
    cd "$srcdir"

    install -Dm644 osu.desktop "$pkgdir/usr/share/applications/osu.desktop"
    install -Dm644 osu.png "$pkgdir/opt/osu/osu.png"
    install -Dm644 directsound-latency.reg "$pkgdir/opt/osu/directsound-latency.reg"
    install -Dm755 osulauncher "$pkgdir/opt/osu/"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/osu/osulauncher "$pkgdir/usr/bin/osu"
    install -Dm775 osu\!install.exe "$pkgdir/opt/osu/game/osu!install.exe"
    #mkdir "$pkgdir/opt/osu/game/"
    #cd "$pkgdir/opt/osu/game/"
    #tar xjpf "$srcdir/osu.tar.bz2"
    chown -R root:games "$pkgdir/opt/osu/game/"
    chmod g+s "$pkgdir/opt/osu/game/"
    chmod g+w "$pkgdir/opt/osu/game/"
}
