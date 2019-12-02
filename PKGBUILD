# Maintainer: techfreak <techfreak@matrix.org>
pkgname=arch-sec-check-git 
pkgver=1.1.0.14.g10b6d63
pkgrel=1
pkgdesc="Compares your local installed packages with the arch linux security database"
arch=(any)
url="https://gitlab.com/techfreak/arch-sec-check"
license=(GPL2)
depends=(openssl)
makedepends=(git rust)
optdepends=()
source=("git+${url}.git")
sha256sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
  cd ${pkgname%-git}
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git} 
  cargo build --release --locked
}

package() {
  cd ${pkgname%-git}
  install -Dm755 "target/release/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

}
