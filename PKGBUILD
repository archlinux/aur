# Maintainer: ValdikSS <iam@valdikss.org.ru>
# Contributor: ValdikSS <iam@valdikss.org.ru>

pkgname=osu
pkgver=20160105
pkgrel=1

source=("http://m1.ppy.sh/r/osu!install.exe"
	"directsound-latency.reg"
	"osu.desktop"
	"osu-fullscreen.desktop"
	"osulauncher"
	"osu.png")

md5sums=('SKIP'
         '1d285eb3a5bdb6a70da89116dec18441'
         'd9749afe35fdd440e560d03b0a20a695'
         '31bada75b7fe984395423c877d9bd036'
         '9759a6ed1e0cf16afea7c496f305422f'
         '33164b758af5645efca61a99f6ddd342')

pkgdesc="Freeware rhythm video game"
url="http://osu.ppy.sh"
arch=(i686 x86_64)
license=(custom)
install=osu.install

depends=(wine xterm winetricks)
depends_x86_64=(lib32-alsa-lib lib32-gnutls)

package() {
    cd "$srcdir"

    install -Dm644 osu.desktop "$pkgdir/usr/share/applications/osu.desktop"
    install -Dm644 osu-fullscreen.desktop "$pkgdir/usr/share/applications/osu-fullscreen.desktop"
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
