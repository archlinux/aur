# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=stegano-git
pkgver=0.3.2.r2.g7684f82
pkgrel=1
pkgdesc="CLI tool for steganography. Supports hiding data in PNG images via LSB Encoding. (git)"
arch=('x86_64')
url="https://github.com/steganogram/stegano-rs"
license=('GPL3')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}-rs"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}-rs/${pkgname%-git}-cli"
  cargo build --release --locked
}

package() {
  cd "${pkgname%-git}-rs"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
