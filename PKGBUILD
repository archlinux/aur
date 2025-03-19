# Maintainer: Pixel

pkgname=walrs
pkgver=1.0.1
pkgrel=1
pkgdesc="A fast color scheme generator"
arch=('x86_64')
url="https://github.com/Pixel2175/walrs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
backup=('etc/walrs/templates/colors.json')
source=("git+https://github.com/Pixel2175/walrs.git#branch=main")

sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  # binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # templates folder
  install -dm755 "$pkgdir/etc/$pkgname/templates"
  cp -r templates/* "$pkgdir/etc/$pkgname/templates/"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # readme
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

