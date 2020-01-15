# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-edit-git
_pkgname=cargo-edit
pkgver=r640.82c09192
pkgrel=1
pkgdesc="A utility for adding cargo dependencies from the command line"
url="https://github.com/killercup/cargo-edit"
conflicts=('cargo-edit')
provides=('cargo-edit')
depends=('cargo')
makedepends=('git')
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
