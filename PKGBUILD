# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hadlock-git
pkgver=1.1.6.r0.gdee5d59
pkgrel=1
pkgdesc="X window manager (git)"
arch=('x86_64')
url="https://github.com/AdaShoelace/hadlock"
license=('MIT')
depends=('dbus' 'libxinerama')
makedepends=('git' 'cargo')
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
provides=("${pkgname%-git}")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --all-features
}

check() {
  cd "${pkgname%-git}"
  cargo test --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
