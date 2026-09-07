# Maintainer: Pranav Kannepalli <pranav.kannepalli@gmail.com>
pkgname=archductor
pkgver=0.5.1
pkgrel=1
pkgdesc="Archductor parallel coding-agent workflow tool built around Git worktrees"
arch=('x86_64')
url="https://github.com/perceo-ai/conductor-arch"
license=('Apache-2.0')
depends=('git' 'github-cli' 'sqlite' 'openssh')
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7273ccae4338fc15d501467b9183d2da5e3d58c3db85156bb6493f676c4b6c2')

build() {
    cd "conductor-arch-$pkgver"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    cargo build --release --locked --workspace
}

package() {
    cd "conductor-arch-$pkgver"
    install -Dm755 target/release/archductor "$pkgdir/usr/bin/archductor"
    install -Dm755 target/release/archcar "$pkgdir/usr/bin/archcar"
    install -Dm644 packaging/assets/archductor.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/archductor.png"
    install -d "$pkgdir/usr/share/fonts/archductor"
    install -m644 packaging/assets/fonts/*.{ttf,otf,txt} \
        "$pkgdir/usr/share/fonts/archductor/"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
