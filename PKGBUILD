# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=transg-tui-git
pkgver=r28.3d06006
pkgrel=2
pkgdesc="Terminal UI for transmission torrent client."
arch=(x86_64)
url="https://github.com/PanAeon/transg-tui"
license=('MIT')
source=(git+"${url}.git")
depends=('openssl' 'gcc-libs')
makedepends=('git' 'rust')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release
}

check() {
  cd "${pkgname%-git}"
  cargo test --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/transgression-tui" \
    "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
