# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fhc-git
pkgver=0.4.0.r2.g22815c5
pkgrel=1
pkgdesc="Fast HTTP Checker (git)"
arch=('x86_64')
url="https://github.com/Edu4rdSHL/fhc"
license=('GPL3')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
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
  install -Dm 644 "${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
}
