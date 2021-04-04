# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gfold-git
pkgver=1.0.3.r2.g6d0a614
pkgrel=1
pkgdesc="CLI tool to help keep track of Git repositories (git)"
arch=('x86_64')
url="https://github.com/nickgerace/gfold"
license=('Apache')
depends=('zlib' 'gcc-libs' 'openssl')
makedepends=('rust' 'git')
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
  cargo build --release --locked --package "${pkgname%-git}"
}

check() {
  cd "${pkgname%-git}"
  cargo test --release --locked --package "${pkgname%-git}"
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
