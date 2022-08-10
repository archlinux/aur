# Maintainer: Andrii Zymohliad <azymohliad@pm.me>
pkgname=watchmate-git
pkgver=v0.1.0
pkgrel=2
pkgdesc='InfiniTime smart watch companion app'
arch=('any')
url='https://gitlab.com/azymohliad/watchmate'
license=('GPL')
depends=('gtk4' 'libadwaita' 'bluez')
makedepends=('git' 'cargo')
provides=('watchmate')
conflicts=('watchmate')
source=("$pkgname::git+https://gitlab.com/azymohliad/watchmate.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --locked
}

package() {
    _appid="io.gitlab.azymohliad.WatchMate"
    cd "$srcdir/$pkgname"
    install -Dm 755 target/release/watchmate -t "$pkgdir/usr/bin"
    install -Dm 644 assets/$_appid.desktop -t "$pkgdir/usr/share/applications"
    install -Dm 644 assets/$_appid.metainfo.xml -t "$pkgdir/usr/share/metainfo"
    install -Dm 644 assets/icons/$_appid.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm 644 assets/icons/$_appid-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
}
