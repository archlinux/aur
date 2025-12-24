# Maintainer: Satakun Utama <linesofcodes at dailitation dot xyz>

pkgname=vencoder-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A graphical tool to transcode video"
arch=("x86_64" "armv7h" "aarch64")
url=https://github.com/lines-of-codes/Vencoder
license=("GPL-3.0-or-later")
depends=("ffmpeg" "gtk3")
source=("https://github.com/lines-of-codes/Vencoder/releases/download/v${pkgver}/vencoder-release.zip"
    "https://github.com/lines-of-codes/Vencoder/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b45a224918975042c74b45c933f2f254cf899d73e8b48091f174b0413c1dd9df0cc1b63733a8f773c99816c4c70d0431188e1eb2bd10d72bbdf51ec28a05fb47'
    '0433474f8dfedf28af70fc056ed876c6354ad6f2558d08f2c3b73467969dba0466e451c75a6e502d8f35bdfbf1597713373668271069195e761a082da27c8df2')
options=("!strip")

_dest="/opt/vencoder-bin"

package() {
    install -d "$pkgdir/$_dest" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    install "$srcdir/Vencoder-${pkgver}/meta/xyz.dailitation.linesofcodes.vencoder.desktop" "$pkgdir/usr/share/applications/xyz.dailitation.linesofcodes.vencoder.desktop"

    ln -s "/tmp" "$pkgdir$_dest/.tmp"

    if [ "${CARCH}" = "aarch64" ]; then
        install "$srcdir/vencoder/vencoder-linux_arm64" "$pkgdir/$_dest"
        ln -s "$_dest/vencoder-linux_arm64" "$pkgdir/usr/bin/vencoder"
    elif [ "${CARCH}" = "i686" ]; then
        install "$srcdir/vencoder/vencoder-linux_armhf" "$pkgdir/$_dest"
        ln -s "$_dest/vencoder-linux_armhf" "$pkgdir/usr/bin/vencoder"
    else
        install "$srcdir/vencoder/vencoder-linux_x64" "$pkgdir/$_dest"
        ln -s "$_dest/vencoder-linux_x64" "$pkgdir/usr/bin/vencoder"
    fi
}
