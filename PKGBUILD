# Maintainer: Interaccoonale <xzzzf.dsx@gmail.com>
pkgname=flut-renamer-bin
pkgver=1.3.3
pkgrel=8
pkgdesc='A GUI application written in Flutter (using GTK on Linux), it helps users batch renaming their files in multiple ways, including inserting text, inserting file metadata and Exif data, replacing text, deleting text, rearranging, transliterating characters.'
arch=('x86_64')
url="https://github.com/sun-jiao/renamer"
depends=('gtk3')
makedepends=()
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/sun-jiao/renamer/releases/download/$pkgver/flut-renamer-linux.tar.gz")
sha256sums=('abde292b18c4f4c1ed44181da2585010979c5cc47e1914bc10de693eeb6daad8')

package() {
    # create the target folders
    install -dm 755 "$pkgdir/opt/${pkgname%-bin}" "$pkgdir/usr/bin/" "$pkgdir/usr/share/pixmaps/" "$pkgdir/usr/share/applications/"
    # remove soft link
    rm "flut-renamer-linux.tar.gz"
    # copy the bundled output to /opt
    cp -rdp --no-preserve=ownership . "$pkgdir/opt/${pkgname%-bin}/"
    cp "data/flutter_assets/assets/desktop.png" "$pkgdir/usr/share/pixmaps/flut-renamer.png"
    gendesk -f -n --pkgname "${pkgname%-bin}" --pkgdesc "$pkgdesc" --name "Flut Renamer" --categories "Utility" --exec "flut-renamer %u" --icon "/usr/share/pixmaps/flut-renamer.png"
    cp "flut-renamer.desktop" "$pkgdir/usr/share/applications/flut-renamer.desktop"
    # symlink to /usr/bin so the app can be found in PATH
    ln -s "/opt/${pkgname%-bin}/flut-renamer" "$pkgdir/usr/bin/${pkgname%-bin}"
}

