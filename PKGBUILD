# Maintainer: Satakun Utama <linesofcodes at dailitation dot xyz>

pkgname=vencoder-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A graphical tool to transcode video"
arch=("x86_64" "armv7h" "aarch64")
url=https://github.com/lines-of-codes/Vencoder
license=("GPL-3.0-or-later")
depends=("ffmpeg" "gtk3")
source=("https://github.com/lines-of-codes/Vencoder/releases/download/v${pkgver}/vencoder-release.zip"
    "https://github.com/lines-of-codes/Vencoder/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('abb223e7c9b1fc408b3a69dfbc789f637dc5adcd13e60c2a2599346f604954c7f0636aeab892fa66d9acad30c468de3281ed2310112d8675537c24cdef363fb9'
        '7d6e93537816bb3ffe96bd72a0469343604fa2d1bcca0b7ea57bb33810049638f440cac6fe4c03e624acff1011e5573978d8a1ae4d7152e986f4bb2b328f6526')
options=("!strip")

_dest="/opt/vencoder-bin"

package() {
    install -d "$pkgdir/$_dest" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    install "$srcdir/Vencoder-${pkgver}/meta/xyz.dailitation.linesofcodes.vencoder.desktop" "$pkgdir/usr/share/applications/xyz.dailitation.linesofcodes.vencoder.desktop"

    ln -s "/tmp" "$pkgdir$_dest/.tmp"

    if [ "${CARCH}" = "aarch64" ]; then
        install "$srcdir/vencoder-linux_arm64" "$pkgdir/$_dest"
        ln -s "$_dest/vencoder-linux_arm64" "$pkgdir/usr/bin/vencoder"
    elif [ "${CARCH}" = "i686" ]; then
        install "$srcdir/vencoder-linux_armhf" "$pkgdir/$_dest"
        ln -s "$_dest/vencoder-linux_armhf" "$pkgdir/usr/bin/vencoder"
    else
        install "$srcdir/vencoder-linux_x64" "$pkgdir/$_dest"
        ln -s "$_dest/vencoder-linux_x64" "$pkgdir/usr/bin/vencoder"
    fi
}
