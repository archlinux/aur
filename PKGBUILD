# Maintainer: Pranav Kannepalli <pranav.kannepalli@gmail.com>
pkgname=archductor
pkgver=0.1.0
pkgrel=1
pkgdesc="Archductor parallel coding-agent workflow tool built around Git worktrees"
arch=('x86_64')
url="https://github.com/perceo-ai/conductor-arch"
license=('Apache-2.0')
depends=('git' 'github-cli' 'sqlite' 'openssh' 'gtk4' 'libadwaita')
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3ce40f320f273a5038d818e071671c9c65c1c3c22662166c5dbfbee3b5795022')

build() {
    cd "conductor-arch-$pkgver"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    cargo build --release --locked --workspace
}

package() {
    cd "conductor-arch-$pkgver"
    install -Dm755 target/release/archductor "$pkgdir/usr/bin/archductor"
    install -Dm755 target/release/archductor-gtk "$pkgdir/usr/bin/archductor-gtk"
    install -Dm755 target/release/archcar "$pkgdir/usr/bin/archcar"
    install -Dm644 packaging/archductor-gtk.desktop \
        "$pkgdir/usr/share/applications/archductor-gtk.desktop"
    install -Dm644 packaging/archductor.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/archductor.svg"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
