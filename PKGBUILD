# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=miro-git
pkgver=r130.da2e85e
pkgrel=1
pkgdesc="A GPU-accelerated terminal emulator written in Rust (git)"
arch=('x86_64')
url="https://github.com/o2sh/miro"
license=('GPL3')
depends=('libxcb' 'xcb-util-keysyms' 'libxkbcommon'
         'libxkbcommon-x11' 'xcb-util-wm' 'mesa'
         'freetype2' 'fontconfig')
makedepends=('rust' 'git' 'python')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
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

check() {
  cd "${pkgname%-git}"
  cargo test --release --locked
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
