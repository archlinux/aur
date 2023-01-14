# Maintainer: Gyara <laxect39@gmail.com>

pkgname=cargo-component-git
_pkgname=cargo-component
pkgver=r33.b8ba57b
pkgrel=1
pkgdesc="Allows conveniently modify features of crate"
url="https://github.com/bytecodealliance/cargo-component"
conflicts=('cargo-component')
provides=('cargo-component')
depends=('cargo')
makedepends=('git')
arch=('i686' 'x86_64')
license=('Apache')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/"
  cargo build --release --target-dir=target
}

package() {
  cd "$srcdir/$_pkgname/"
  install -Dm755 "target/release/cargo-component" "$pkgdir/usr/bin/cargo-component"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
