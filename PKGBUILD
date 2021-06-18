# Maintainer: nephitejnf <nephitejnf@gmail.com>
# Co-Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=lightcord-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="A simple - customizable - Discord Client"
arch=("x86_64")
url="https://github.com/Lightcord/Lightcord"
license=('MIT')
depends=('libxss')
optdepends=('libappindicator-gtk3: system tray icon support')
provides=('lightcord')
conflicts=('lightcord-git')
makedepends=()
source=("$pkgname-$pkgver.zip::https://lightcord.org/api/v1/gh/releases/Lightcord/Lightcord/v$pkgver/lightcord-linux-x64.zip"
        "Lightcord.desktop"
        "https://raw.githubusercontent.com/Lightcord/LightcordLogos/master/lightcord/lightcord.png"
        "https://raw.githubusercontent.com/Lightcord/Lightcord/master/LICENSE"
)
md5sums=('4c6c4a83bf975b095f6ebd90902bd299'
         '88f6b95886eeeddff6878e4c5acd2f13'
         'f1ace6f149a3d778bfb789d10181d877'
         '738e1aa6aff38e2ced608999d58ff5d7')

package() {
    # Create the folder structure
    install -d "$pkgdir"/opt/lightcord
    install -d "$pkgdir"/usr/bin
    install -d "$pkgdir"/usr/share/pixmaps

    # Copy files over and set rights
    cp -a "$srcdir"/. "$pkgdir"/opt/lightcord
    chmod 755 "$pkgdir"/opt/lightcord/lightcord

    # Copy license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Link icon and add Desktop
    install -Dm644 "$pkgdir"/opt/lightcord/lightcord.png "$pkgdir"/usr/share/pixmaps
    install -Dm644 "$pkgdir"/opt/lightcord/Lightcord.desktop -t "$pkgdir"/usr/share/applications

    # Create symlink in /usr/bin; stolen from other PKGBUILDs
    ln -s /opt/lightcord/lightcord "$pkgdir"/usr/bin/lightcord
}
