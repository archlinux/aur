pkgname=mt
pkgver=0.1.0+alpha2020.12.25
pkgrel=1
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Terminal")
makedepends=('cargo')
depends=('gtk3' 'vte3')
arch=('x86_64')
url="https://gitlab.com/Miridyan/terminal"
source=("terminal-v$pkgver.tar.gz::https://gitlab.com/Miridyan/terminal/-/archive/v$pkgver/terminal-v$pkgver.tar.gz")
license=('BSD')
sha512sums=('746a2971412a40022ffd5639d6ede5146c3d6c55c6828bc9d332cf409012b2584758f4c924eaac4bc9453b75c321e316f124afee1cc7ef332ff098d3139d86c9')

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
