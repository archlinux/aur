# Maintainer: nixval <nicovaliantoku@gmail.com>
pkgname=declarch
pkgver=0.2.0
pkgrel=1
pkgdesc="A declarative package management for Arch base Linux, inspired by Nix workflow."
arch=('x86_64')
url="https://github.com/nixval/declarch"
license=('MIT')
depends=('pacman' 'git')
optdepends=(
  'paru: AUR backend for syncing'
  'yay: alternative AUR backend'
  'flatpak: For managing Flatpak applications'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dddf761380f76c6ba6b25f2d9693daa61f94f108333558db91caa68d0a637173')

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
