# Maintainer: Interaccoonale <xzzzf.dsx@gmail.com>
pkgname=renamer
pkgver=1.3.2
pkgrel=1
pkgdesc='A bulk file renamer written in flutter (dart). '
arch=('x86_64')
url="https://github.com/sun-jiao/renamer"
depends=('')
makedepends=()
license=('GPL3')
source=("https://github.com/sun-jiao/renamer/releases/download/$pkgver/renamer-linux.tar.gz")
sha256sums=('faba72a0409d85d590f348a354bb8c52730634f7b2c0e413290a462d94b31ed3')

package() {
    # create the target folders
    install -dm 755 "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin/" "$pkgdir/usr/share/pixmaps/" "$pkgdir/usr/share/applications/"
    # remove soft link
    rm "renamer-linux.tar.gz"
    # copy the bundled output to /opt
    cp -rdp --no-preserve=ownership . "$pkgdir/opt/$pkgname/"
    cp "data/flutter_assets/assets/desktop.png" "$pkgdir/usr/share/pixmaps/renamer.png"
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "$pkgname" --categories "Utility" --exec "renamer %u" --icon "/usr/share/pixmaps/renamer.png"
    cp "renamer.desktop" "$pkgdir/usr/share/applications/renamer.desktop"
    # symlink to /usr/bin so the app can be found in PATH
    ln -s "/opt/$pkgname/renamer" "$pkgdir/usr/bin/$pkgname"
}

