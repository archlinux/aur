# Maintainer: Nico Valianto Kusuma <YOUR_EMAIL@gmail.com>

pkgname=declarch
pkgver=0.2.4
pkgrel=1
pkgdesc="A declarative package management for Arch base Linux, inspired by Nix workflow."
arch=('x86_64')
url="https://github.com/nixval/declarch"
license=('MIT')
depends=('pacman' 'git')
optdepends=(
  'paru: AUR backend for syncing'
  'flatpak: For managing Flatpak applications'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7dc970a2d78e99f9559b069eccf44156c6bf86dc6ce8fefa55e1d935fb98924c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
