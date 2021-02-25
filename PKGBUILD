# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fblog-git
pkgver=2.3.0.r4.g91ca01a
pkgrel=1
pkgdesc="Small command-line JSON log viewer (git)"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('custom:WTFPL')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

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
  install -Dm 644 README.org -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
