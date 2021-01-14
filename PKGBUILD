pkgname=mt
pkgver=0.1.0+alpha2021.01.14
pkgrel=3
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Terminal")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/terminal"
source=("terminal-v$pkgver.tar.gz::https://gitlab.com/Miridyan/terminal/-/archive/v$pkgver/terminal-v$pkgver.tar.gz")
license=('BSD')
sha512sums=('aaf0f0150d0b8dbc28087b269564ba87ae8478fdcde73193e718b13bdb7df73d829cdb5e83bef0d25f6bcfb64ee4ab8ac665badef09e1f58377352ac83536fb3')

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
