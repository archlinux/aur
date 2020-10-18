# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=huniq-git
pkgver=r42.ee7136d
pkgrel=1
pkgdesc="Filter out duplicates on the command line (git)"
arch=('x86_64')
url="https://github.com/koraa/huniq"
license=('BSD')
makedepends=('cargo' 'git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  sed -n '/Copyright/,//p' readme.md > LICENSE
  cargo build --release
}

check() {
  cd "${pkgname%-git}"
  cargo test --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
