# Maintainer: Nico Valianto Kusuma <YOUR_EMAIL@gmail.com>

pkgname=declarch
pkgver=0.2.5
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
sha256sums=('e45d8227b4e417b062ad79e75cfb45739a055831bdf5f1c87f062c30ce4ef28f')

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
