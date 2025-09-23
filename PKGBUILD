# Maintainer: Satakun Utama <linesofcodes at dailitation dot xyz>

pkgname=vencoder-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A graphical tool to transcode video"
arch=("x86_64" "armv7h" "aarch64")
url=https://gitskette.dailitation.xyz/linesofcodes/vencoder
license=("GPL-3.0-or-later")
depends=("ffmpeg" "gtk3")
source=("https://gitskette.dailitation.xyz/linesofcodes/vencoder/releases/download/${pkgver}/vencoder-release.zip"
    "https://gitskette.dailitation.xyz/linesofcodes/vencoder/archive/${pkgver}.tar.gz")
b2sums=('2e841eef92c9e5b400dc471a2ec818ecdb2475e32aafa64f18201d8a4a566905057f039b88b97ca86c5c7559ccf3db2052f6e9a8c622d0e9aff6fdd03141a092'
    'c07c2b23cd3602f19f5add8aeaa3c9f7a5277cf89a34e6c7cb9ba060f5ab2a7e1b6e482c40882c3bcd8c1184dbccfc4f49372b50f115bf91845f252fb53d40b9')
options=("!strip")

_dest="/opt/vencoder-bin"

package() {
    install -d "$pkgdir/$_dest" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    install "$srcdir/vencoder/meta/xyz.dailitation.linesofcodes.vencoder.desktop" "$pkgdir/usr/share/applications/xyz.dailitation.linesofcodes.vencoder.desktop"

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
