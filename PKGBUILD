# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-git
pkgver=0.5.1.r2.g093f3a0
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --locked --all-features
}

check() {
  cd "${pkgname%-git}"
  cargo test --release --locked
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
