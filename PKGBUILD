# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=suckit-git
pkgver=0.1.2.r0.g7c05a18
pkgrel=1
pkgdesc="Recursively visit and download a website's content to your disk (git)"
arch=('any')
url="https://github.com/Skallwar/suckit"
license=('Apache')
depends=('openssl' 'gcc-libs')
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
