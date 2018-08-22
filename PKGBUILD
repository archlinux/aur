# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=way-cooler-bg-git
pkgver=0.3.0+75+g9dde66b
pkgrel=1
pkgdesc='The program that draws a background for Way Cooler (git)'
arch=(i686 x86_64)
url=https://github.com/way-cooler/way-cooler-bg
license=(MIT)
depends=(way-cooler)
makedepends=(rust)
provides=(way-cooler-bg)
conflicts=(way-cooler-bg)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
  cd ${pkgname/-git//}
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2)+$(git rev-list --count HEAD)+g$(git describe --always)"
}

build() {
  cd ${pkgname/-git//}
  cargo build --release
}

package() {
  cd ${pkgname/-git//}
  install -D target/release/wc-bg "$pkgdir"/usr/bin/way-cooler-bg
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/way-cooler-bg LICENSE
}
