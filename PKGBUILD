# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=choose-rust-git
pkgver=r71.9bf0214
pkgrel=1
pkgdesc="A fast, human-friendly alternative to awk(1) and cut(1)"
url="https://github.com/theryangeary/choose"
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "choose"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "choose"
  cargo build --release --locked --all-features
}

check() {
  cd "choose"
  cargo test --release --locked
}

package() {
  install -Dm755 "choose/target/release/choose" "$pkgdir/usr/bin/choose"
}
