# Maintainer: Interaccoonale <xzzzf.dsx@gmail.com>
pkgname=flut-renamer-bin
pkgver=1.5.0
pkgrel=10
pkgdesc='A GUI application written in Flutter (using GTK on Linux), it helps users batch renaming their files in multiple ways, including inserting text, inserting file metadata and Exif data, replacing text, deleting text, rearranging, transliterating characters.'
arch=('x86_64')
url="https://github.com/sun-jiao/flut-renamer"
depends=('gtk3')
makedepends=()
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/sun-jiao/flut-renamer/releases/download/$pkgver/flut-renamer-linux.tar.gz")
sha256sums=('0d7b052a946ae3a9208aeea7d02aa62763e1eaa882335d2c00a56e7b7bcc826b')

package() {
    # create the target folders
    install -dm 755 "$pkgdir/opt/${pkgname%-bin}" "$pkgdir/usr/bin/" "$pkgdir/usr/share/pixmaps/" "$pkgdir/usr/share/applications/"
    # remove soft link
    rm "flut-renamer-linux.tar.gz"
    # copy the bundled output to /opt
    cp -rdp --no-preserve=ownership . "$pkgdir/opt/${pkgname%-bin}/"
    cp "data/flutter_assets/assets/desktop.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --pkgname "${pkgname%-bin}" --pkgdesc "$pkgdesc" --name "Flut Renamer" --categories "Utility" --exec "${pkgname%-bin} %u" --icon "/usr/share/pixmaps/${pkgname%-bin}.png"
    cp "${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
    # symlink to /usr/bin so the app can be found in PATH
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}

