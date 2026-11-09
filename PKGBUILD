# Maintainer: DonutsDelivery <admin@donutsdelivery.online>
pkgname=donutcleaner-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="System maintenance and package dependency manager for Linux, GTK4 and Rust (formerly SysClean)"
arch=('x86_64')
url="https://github.com/DonutsDelivery/Smart-Cleaner"
license=('MIT')
options=('!debug')
depends=('gtk4' 'libadwaita' 'polkit' 'hicolor-icon-theme')
optdepends=('pacman-contrib: package cache cleanup with paccache')
provides=('donutcleaner' 'sysclean' 'sysclean-bin')
conflicts=('donutcleaner' 'sysclean' 'sysclean-bin')
replaces=('sysclean-bin')
source=("donutcleaner-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/donutcleaner-x86_64.tar.gz")
sha256sums=('4b16770ca2bce70181c7d4aa6e0393e703f3ae38d472317392a4f4e61051c3df')

package() {
    cd "$srcdir/donutcleaner"
    local appid=online.donutsdelivery.DonutCleaner
    install -Dm755 donutcleaner "$pkgdir/usr/bin/donutcleaner"
    install -Dm755 donutcleaner-helper "$pkgdir/usr/lib/donutcleaner/donutcleaner-helper"
    install -Dm644 "$appid.helper.policy" "$pkgdir/usr/share/polkit-1/actions/$appid.helper.policy"
    install -Dm644 "$appid.desktop" "$pkgdir/usr/share/applications/$appid.desktop"
    install -Dm644 "$appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
    install -d "$pkgdir/usr/share/icons"
    cp -r hicolor "$pkgdir/usr/share/icons/"
    install -Dm644 "$appid.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
