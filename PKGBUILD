# Contributor: Mike Cooper <mythmon@elem.us>
# Maintainer: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cargo-edit-git
_pkgname=cargo-edit
pkgver=r365.ac284bb7
pkgrel=1
pkgdesc="A utility for adding cargo dependencies from the command line"
url="https://github.com/killercup/cargo-edit"
conflicts=('cargo-edit')
provide=('cargo-edit')
depends=('cargo')
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
  for sub in rm add upgrade; do
      install -Dm755 "target/release/cargo-$sub" "$pkgdir/usr/bin/cargo-$sub"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
