# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=jilu-git
pkgver=0.4.0.r2.gc334c5d
pkgrel=1
pkgdesc="Generate a change log based on the state of your Git repository (git)"
arch=('x86_64')
url="https://github.com/rustic-games/jilu"
license=('Apache')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
