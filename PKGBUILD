# Maintainer: nixval <nicovaliantoku@gmail.com>

pkgname=declarch-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Universal declarative package manager - unify AUR, flatpak, npm, cargo, pip, and custom backends (pre-built binary)"
arch=('x86_64')
url="https://github.com/nixval/declarch"
license=('MIT')
depends=('pacman' 'git')
optdepends=(
  'paru: AUR backend for syncing'
  'yay: Alternative AUR helper'
  'flatpak: For managing Flatpak applications'
)
provides=('declarch')
conflicts=('declarch' 'declarch-git')

source=("declarch-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/declarch-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')  # Update after creating release

package() {
  # Install binaries
  install -Dm755 "declarch" "$pkgdir/usr/bin/declarch"
  install -Dm755 "dcl" "$pkgdir/usr/bin/dcl"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install shell completions
  install -Dm644 <(declarch completions bash) \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 <(declarch completions fish) \
    "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname".fish
  install -Dm644 <(declarch completions zsh) \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
