# Maintainer: Scqxd <dimakuzmin245@gmail.com>

pkgname=archforge-git
pkgver=0.1.0
pkgrel=1
pkgdesc="AI-powered TUI for PKGBUILD generation and AUR management"
arch=('x86_64' 'aarch64')
url="https://github.com/Scqxd/archforge"
license=('MIT')
depends=('rust' 'cargo')
makedepends=('cargo' 'openssl' 'pkgconf')
optdepends=(
    'makepkg: for building packages'
    'paru: AUR helper'
    'yay: AUR helper'
)
provides=('archforge')
conflicts=('archforge')
source=("https://github.com/Scqxd/archforge/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/archforge" "$pkgdir/usr/bin/archforge"
    install -Dm644 "archforge.1" "$pkgdir/usr/share/man/man1/archforge.1"
    install -Dm644 "completions/archforge.bash" "$pkgdir/usr/share/bash-completion/completions/archforge"
    install -Dm644 "completions/archforge.fish" "$pkgdir/usr/share/fish/completions/archforge.fish"
    install -Dm644 "completions/_archforge" "$pkgdir/usr/share/zsh/site-functions/_archforge"
}
