# Maintainer: Andrii Zymohliad <azymohliad@pm.me>
pkgname=watchmate-git
pkgver=0.5.0.r0.7ef2541
pkgrel=1
pkgdesc='InfiniTime smart watch companion app'
arch=('any')
url='https://github.com/azymohliad/watchmate'
license=('GPL')
depends=('gtk4' 'libadwaita' 'bluez')
makedepends=('git' 'cargo')
provides=('watchmate')
conflicts=('watchmate')
source=("$pkgname::git+https://github.com/azymohliad/watchmate.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s" "$(git describe --long | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"
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
    install -Dm 644 assets/$_appid.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
    install -Dm 644 assets/icons/$_appid.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm 644 assets/icons/$_appid-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
}
