# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tenshi-rs-git
pkgver=0.2.0
pkgrel=1
pkgdesc='Unbound local-zone generator for curated hosts files (git)'
arch=(aarch64 arm armv6h armv7h i686 x86_64)
url=https://github.com/flacks/tenshi
license=(GPL3)
makedepends=(git rust)
optdepends=('sudo: to write to destination as superuser')
provides=(tenshi-rs)
conflicts=(tenshi-rs)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
  cd tenshi
  git describe --tags | sed 's#-#+#g'
}

build() {
  cd tenshi
  cargo build --release --locked
}

package() {
  cd tenshi
  install -D target/release/tenshi "$pkgdir"/usr/bin/tenshi-rs
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/tenshi-rs
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/tenshi-rs
}
