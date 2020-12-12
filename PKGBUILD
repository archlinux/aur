# Contributor: orhun <orhunparmaksiz@gmail.com>
# Contributor: reujab <reujab@gmail.com>

pkgname=silver-git
pkgver=1.1.0.r51.gb25b7a0
pkgrel=2
pkgdesc="A cross-shell customizable powerline-like prompt with icons (git)"
arch=('x86_64')
url="https://github.com/reujab/silver"
license=('MIT')
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

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 license -t "$pkgdir/usr/share/licenses/$pkgname"
}
