# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=gallery-tui
pkgver=0.2.4
pkgrel=1
pkgdesc="A terminal image gallery powered by ratatui and chafa."
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/gallery-tui"
license=('MIT')
depends=('chafa')
makedepends=('git' 'rust')
optdepends=('perl-image-exiftool: write image metadata from the detail editor')
conflicts=("$pkgname-git")
options=('!lto')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$pkgname/"
}
