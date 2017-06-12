# Maintainer: Zanny <lordzanny@gmail.com>
pkgname=pachost
pkgver=0.1.0
pkgrel=1
pkgdesc="A rocket powered dumb file server to share a pacman cache on the local network."
arch=(i686 x86_64)
url="https://gitlab.com/zanny/pachost"
license=('GPL')
makedepends=(cargo git rust-nightly)
source=('git+https://gitlab.com/zanny/pachost.git'
        'pachost.service')
sha256sums=('SKIP'
            'd180cde13c353df50940491ef5ad4bffd9e1abed661da964bd413548e4d7d8a8')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname/target/release/pachost" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname/templates/index.html.tera" "$pkgdir/usr/share/$pkgname/index.html.tera"
    install -Dm644 "$srcdir/pachost.service" "$pkgdir/usr/lib/systemd/system/pachost.service"
}
