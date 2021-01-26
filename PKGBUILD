pkgname=mt
pkgver=0.1.0+alpha2021.01.25
pkgrel=1
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Terminal")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/terminal"
source=("terminal-v$pkgver.tar.gz::https://gitlab.com/Miridyan/terminal/-/archive/v$pkgver/terminal-v$pkgver.tar.gz")
license=('BSD')
sha512sums=('56c13806c5b686c09f33d1f285f0ed079fa3670a31566943f96dd76ccb627a08024fef743f5126b59fd7c9d5f7e9eab62e326ad730ea510ce8c868b9bc485749')

build() {
    cd $srcdir/terminal-v$pkgver
    cargo build --release
}

package() {
    cd $srcdir/terminal-v$pkgver

    install -Dm 755 "target/release/terminal" "$pkgdir/usr/bin/mt"
    install -Dm 644 "data/com.gitlab.miridyan.Terminal.desktop" "$pkgdir/usr/share/applications/com.gitlab.miridyan.Terminal.desktop"
    install -Dm 644 "data/icons/com.gitlab.miridyan.Terminal.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.gitlab.miridyan.Terminal.svg"
    install -Dm 644 "data/profile/default.tpfl.yml" "$pkgdir/usr/share/mt/profiles/default.tpfl.yml"
    install -Dm 644 "data/colorscheme/base16.tscm.yml" "$pkgdir/usr/share/mt/colorschemes/base16.tscm.yml"
}
