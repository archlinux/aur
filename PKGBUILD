# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=tmux-sessionizer
pkgver=0.4.5
pkgrel=1
pkgdesc="A tool for opening git repositories as tmux sessions"
arch=("x86_64")
url="https://github.com/jrmoulton/tmux-sessionizer"
license=("MIT")
depends=("tmux")
makedepends=("rust")
provides=("$pkgname")
conflicts=("$pkgname")
options=("!lto") # https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("37cceae77bad373452d08b990065e7d1e8ed7b038a0af126aa4403332364530e")

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 target/release/tms "$pkgdir/usr/bin/tms"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
