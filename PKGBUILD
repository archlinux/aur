# Maintainer: Lev Sauliak levizorri@protonmail.com
# Contributor: 

pkgname=hyprland-workspaces-tui
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal-based user interface (TUI) wrapper for the hyprland-workspaces CLI utility"
arch=('x86_64')
url="https://github.com/Levizor/hyprland-workspaces-tui"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/Levizor/hyprland-workspaces-tui/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('641042d7164a92e6161d4442ef707d0dce4b5649fe18d10c166d37d4c839c5d1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo fetch --locked

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 <("$pkgdir/usr/bin/$pkgname" --completions bash) \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 <("$pkgdir/usr/bin/$pkgname" --completions zsh) \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 <("$pkgdir/usr/bin/$pkgname" --completions fish) \
    "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

}

