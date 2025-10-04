# Maintainer: Rgallaispou <rgallaispou@gmail.com>
pkgname=aarch64-esr-decoder-git
pkgver=r330.dd9cc37b53d5
pkgrel=1
pkgdesc='A small utility for decoding aarch64 ESR register values.'
arch=('x86_64')
url='https://github.com/google/aarch64-esr-decoder'
license=('Apache-2.0')
makedepends=('git' 'rust')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
