# Maintainer: nephitejnf <nephitejnf@gmail.com>
pkgname=lightcord-bin
pkgver=dev
pkgrel=3
pkgdesc="A simple - customizable - Discord Client"
arch=("x86_64")
url="https://github.com/Lightcord/Lightcord"
license=('MIT')
depends=()
makedepends=()
source=("$pkgname-$pkgver.zip::https://lightcord.org/api/v1/gh/releases/Lightcord/Lightcord/$pkgver/lightcord-linux-x64.zip"
        "Lightcord.desktop"
        "https://raw.githubusercontent.com/Lightcord/LightcordLogos/master/lightcord/lightcord.png")
md5sums=("SKIP"
        "93edcd577375c0b3b045b7fbd9dcf09a"
        "f1ace6f149a3d778bfb789d10181d877")

package() {
    # Create the folder structure
    install -d "$pkgdir"/opt/lightcord
    install -d "$pkgdir"/usr/bin
    install -d "$pkgdir"/usr/share/pixmaps

    # Copy files over and set rights
    cp -a "$srcdir"/. "$pkgdir"/opt/lightcord
    chmod 755 "$pkgdir"/opt/lightcord/lightcord

    # Link icon and add Desktop
    ln -s /opt/lightcord/lightcord.png "$pkgdir"/usr/share/pixmaps/lightcord.png
    install -Dm644 "$pkgdir"/opt/lightcord/Lightcord.desktop -t "$pkgdir"/usr/share/applications

    # Create symlink in /usr/bin; stolen from other PKGBUILDs
    ln -s /opt/lightcord/lightcord "$pkgdir"/usr/bin/lightcord
}
