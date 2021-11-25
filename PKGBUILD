# Maintainer: CohenArthur <cohenarthur.dev@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>

pkgname=jinko-git
pkgver=0.2.0.r11.gc7ee50e
pkgrel=1
pkgdesc="Jinko is a small and safe interpreted language with fast Rust and C FFI"
arch=('any')
url="https://github.com/CohenArthur/jinko"
license=('GPLv2')
depends=()
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
