# Maintainer: Mike Cooper <mythmon@elem.us>

pkgname=cargo-edit-git
_pkgname=cargo-edit
pkgver=r80.4443aeb
pkgrel=1
pkgdesc="A utility for adding cargo dependencies from the command line"
url="https://github.com/killercup/cargo-edit"
conflicts=('cargo-edit')
provide=('cargo-edit')
depends=('rust')
makedepends=('git' 'cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname/"
  install -Dm755 target/release/cargo-add "$pkgdir/usr/bin/cargo-add"
  install -Dm755 target/release/cargo-list "$pkgdir/usr/bin/cargo-list"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
