# Maintainer: nephitejnf <nephitejnf@gmail.com>
# Co-Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=lightcord-bin
pkgver=0.1.9
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

sha256sums=('acfea4f0420d508d16d8d261734031c3dca18a835bcdce10db34f436299e2670'
            '15032409c31cbf25f0adadeff9b09e3ef45c265ddfbbf48d9cfe91d1da145124'
            '27f7abb09a61deff3a4d6944f1dab4ab3f6ada35767e586fad0a195fab35e0b9'
            '80e14fe1ef2af1b4049874ae3babdc597fe5b49e959c7593333ad59d3a20b94d')

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

