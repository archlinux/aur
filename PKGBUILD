# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kmon-git
pkgver=1.5.3.r0.g57bf544
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor (git)"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libx11')
makedepends=('rust' 'python' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm 644 "man/${pkgname%-git}.8" -t "$pkgdir/usr/share/man/man8"
}
