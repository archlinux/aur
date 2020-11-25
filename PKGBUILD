# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Vicente Reyes <vreyesvaldivieso@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=funkicrab-git
pkgver=r18.98528cc
pkgrel=2
pkgdesc="Optimising Brainfuck compiler written in Rust (git)"
arch=('x86_64')
url="https://github.com/zesterer/funkicrab"
license=('unknown')
makedepends=('rust' 'git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --locked
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
