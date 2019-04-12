# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-evil-git
pkgver=1.0.3+evil+7+g74a1684
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (evil branch, git)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(git rust)
provides=(hunter)
conflicts=(hunter hunter-git hunter-evil)
source=(git+$url#branch=evil)
sha512sums=(SKIP)

pkgver() {
  cd hunter
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd hunter
  cargo build --release
}

package() {
  cd hunter
  install -D target/release/hunter -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
