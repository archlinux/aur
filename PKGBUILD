pkgname=mt
pkgver=0.1.0+alpha2021.01.14
pkgrel=1
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Terminal")
makedepends=('cargo')
depends=('gtk3' 'vte3')
arch=('x86_64')
url="https://gitlab.com/Miridyan/terminal"
source=("terminal-v$pkgver.tar.gz::https://gitlab.com/Miridyan/terminal/-/archive/v$pkgver/terminal-v$pkgver.tar.gz")
license=('BSD')
sha512sums=('9ef7a05482dd024e0997536d4ca596b9676d23d32e207b6e872b41210fca372d00be890f1edba96485e1083f9e907b9831d21ff8db68222ac5ea5cae477f17f6')

build() {
    cd $srcdir/terminal-v$pkgver
    cargo build --release
    strip --strip-all target/release/terminal
}

package() {
    cd $srcdir/terminal-v$pkgver

    install -Dm 755 "target/release/terminal" "$pkgdir/usr/bin/com.gitlab.miridyan.Terminal"
    install -Dm 644 "gresource/com.gitlab.miridyan.Terminal.desktop" "$pkgdir/usr/share/applications/com.gitlab.miridyan.Terminal.desktop"
    install -Dm 644 "gresource/icons/com.gitlab.miridyan.Terminal.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.gitlab.miridyan.Terminal.svg"
    install -Dm 644 "gresource/profile/default.tpfl.yml" "$pkgdir/usr/share/com.gitlab.miridyan.Terminal/profiles/default.tpfl.yml"
    install -Dm 644 "gresource/colorscheme/base16.tscm.yml" "$pkgdir/usr/share/com.gitlab.miridyan.Terminal/colorschemes/base16.tscm.yml"
}
