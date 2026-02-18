# Maintainer: BitYoungjae <bityoungjae@gmail.com>
pkgname=chalkak
pkgver=0.4.1
pkgrel=2
pkgdesc="Hyprland screenshot preview and editor utility"
arch=('x86_64' 'aarch64')
options=(!lto)
url="https://github.com/bityoungjae/chalkak"
_srcname="ChalKak"
license=('MIT' 'Apache-2.0')
depends=('gtk4' 'hyprland' 'grim' 'slurp' 'wl-clipboard')
makedepends=('rust' 'cargo' 'pkgconf' 'gtk4' 'cmake' 'clang' 'git')
optdepends=('chalkak-ocr-models: OCR text recognition support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a38d1f33b0c712bf11a5c44641f70dfdded212cda1c65cefcc52630ff914ccb8')

build() {
  cd "$_srcname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$_srcname-$pkgver"

  # Install binary
  install -Dm755 "target/release/chalkak" "$pkgdir/usr/bin/chalkak"

  # Install documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md" || true
  install -Dm644 "README.ko.md" "$pkgdir/usr/share/doc/$pkgname/README.ko.md" || true

  # Install dual-license texts
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT" || true
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" || true
}
