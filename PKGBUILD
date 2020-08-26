# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=monolith-git
_pkgname=${pkgname%-git}
pkgver=2.3.1+r393+g8462b6b
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files (git)'
arch=(x86_64)
url=https://github.com/Y2Z/monolith
license=(Unlicense)
depends=(openssl)
makedepends=(git cargo)
provides=(monolith)
conflicts=(monolith)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/+/)+r$(git rev-list --count HEAD)+g$(git describe --always)
}

build() {
  cd $_pkgname
  cargo build --release
}

package() {
  cd $_pkgname
  install -D target/release/$_pkgname -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$_pkgname
}
