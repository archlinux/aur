# Maintainer: Andrii Zymohliad <azymohliad@pm.me>
pkgname=qwertone-git
pkgver=0.4.0.r0.24bcfb0
pkgrel=1
pkgdesc='Turns your PC into musical instrument'
arch=(x86_64)
url='https://gitlab.com/azymohliad/qwertone'
license=('GPL')
depends=('gtk3' 'alsa-lib')
makedepends=('git' 'cargo')
provides=('qwertone')
conflicts=('qwertone')
source=("$pkgname::git+https://gitlab.com/azymohliad/qwertone.git")
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
    _appid="com.gitlab.azymohliad.Qwertone"
    cd "$srcdir/$pkgname"
    install -Dm 755 target/release/qwertone -t "$pkgdir/usr/bin"
    install -Dm 644 res/$_appid.desktop -t "$pkgdir/usr/share/applications"
    install -Dm 644 res/$_appid.appdata.xml -t "$pkgdir/usr/share/metainfo"
    install -Dm 644 res/icons/$_appid.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm 644 res/icons/$_appid-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
}
