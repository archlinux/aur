# Maintainer: nephitejnf <nephitejnf@gmail.com>
pkgname=lightcord-bin
pkgver=v0.1.4
pkgrel=1
pkgdesc="A simple - customizable - Discord Client"
arch=("x86_64")
url="https://github.com/Lightcord/Lightcord"
provides=('discord')
license=('MIT')
depends=()
makedepends=()
source=("$pkgname-$pkgver.zip::https://lightcord.deroku.xyz/api/v1/gh/releases/Lightcord/Lightcord/$pkgver/lightcord-linux-x64.zip"
        "Lightcord.desktop"
        "https://raw.githubusercontent.com/Lightcord/LightcordLogos/master/lightcord/lightcord.png")
md5sums=("0e857820865cc5d7e7daf9090b8dbc8f"
        "7f7ade1f48d8aa92809463ba40663936"
        "f1ace6f149a3d778bfb789d10181d877")

package() {
    # Create the folder structure
    install -d "$pkgdir"/usr/share/lightcord
    install -d "$pkgdir"/usr/bin
    install -d "$pkgdir"/usr/share/pixmaps

    # Copy files over and set rights
    cp -a "$srcdir"/. "$pkgdir"/usr/share/lightcord
    chmod 755 "$pkgdir"/usr/share/lightcord/Lightcord

    # Link icon and add Desktop
    ln -s /usr/share/lightcord/lightcord.png "$pkgdir"/usr/share/pixmaps/lightcord.png
    install -Dm644 "$pkgdir"/usr/share/lightcord/Lightcord.desktop -t "$pkgdir"/usr/share/applications

    # Create symlink in /usr/bin; stolen from other PKGBUILDs
    ln -s /usr/share/lightcord/Lightcord "$pkgdir"/usr/bin/lightcord
}
