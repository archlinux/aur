pkgname=mt
pkgver=0.1.0+alpha2021.01.19
pkgrel=1
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Terminal")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/terminal"
source=("terminal-v$pkgver.tar.gz::https://gitlab.com/Miridyan/terminal/-/archive/v$pkgver/terminal-v$pkgver.tar.gz")
license=('BSD')
sha512sums=('21c7d29ef5385fd5b98fd3777ab092588c4365454f10599dd8a41db8ef975fee5bba30745a813441b508fae252c0db65dbe5f31d150ba7149c7d16bbcf3de9ae')

build() {
    cd $srcdir/terminal-v$pkgver
    cargo build --release
    strip --strip-all target/release/terminal
}

package() {
    cd $srcdir/terminal-v$pkgver

    install -Dm 755 "target/release/terminal" "$pkgdir/usr/bin/mt"
    install -Dm 644 "data/com.gitlab.miridyan.Terminal.desktop" "$pkgdir/usr/share/applications/com.gitlab.miridyan.Terminal.desktop"
    install -Dm 644 "data/icons/com.gitlab.miridyan.Terminal.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.gitlab.miridyan.Terminal.svg"
    install -Dm 644 "data/profile/default.tpfl.yml" "$pkgdir/usr/share/mt/profiles/default.tpfl.yml"
    install -Dm 644 "data/colorscheme/base16.tscm.yml" "$pkgdir/usr/share/mt/colorschemes/base16.tscm.yml"
}
