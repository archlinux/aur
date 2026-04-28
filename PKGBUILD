# Maintainer: C-Yassin <c.yassin.org@gmail.com>
pkgname=flameget
pkgver=1.1
pkgrel=1
pkgdesc="A GTK4 Download Manager wrapping Aria2, Curl, and YT-DLP"
arch=('x86_64' 'aarch64')
url="https://github.com/C-Yassin/FlameGet"
license=('MIT' 'LGPL3')
depends=('python' 'python-gobject' 'python-flask' 'gtk4' 'libappindicator-gtk3'
         'aria2' 'python-pycurl' 'yt-dlp' 'python-requests' 'python-waitress'
         'aria2p' 'ffmpeg')
makedepends=('git')

_botguard_ver="v0.1.2"

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31040c56993404e57bd82e301b8ad634c6f5a4f590a486abad2e8192e7a39dce')
sha256sums_x86_64=('4f2ec561e8f9fadece7deadc6ce0624fbdedd852222c3eb194c22153b1323129')
sha256sums_aarch64=('4d038857374a69aea9be8ded981d93a776dc88d4e254f5c6d292746099abf69a')

source_x86_64=("https://codeberg.org/ThetaDev/rustypipe-botguard/releases/download/$_botguard_ver/rustypipe-botguard-$_botguard_ver-x86_64-unknown-linux-gnu.tar.xz")

source_aarch64=("https://codeberg.org/ThetaDev/rustypipe-botguard/releases/download/$_botguard_ver/rustypipe-botguard-$_botguard_ver-aarch64-unknown-linux-gnu.tar.xz")


package() {
    cd "FlameGet-$pkgver"

    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    cp -r icons binaries "$pkgdir/usr/lib/$pkgname/"

    install -m644 *.py *.json *.css *.sh -t "$pkgdir/usr/lib/$pkgname/"

    install -m644 flameget.desktop -t "$pkgdir/usr/share/applications/"
    install -m644 flameget.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

    install -m755 "$srcdir/rustypipe-botguard" -t "$pkgdir/usr/lib/$pkgname/binaries/"

    install -m755 flameget.sh "$pkgdir/usr/bin/flameget"
}
