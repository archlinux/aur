# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=monolith
pkgver=2.0.1+r18+gcc09c2b
_commit=cc09c2ba0135e0618aa7eaefcffb8dbdc41421f3
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(i686 x86_64)
url=https://github.com/Y2Z/monolith
license=(custom)
depends=(openssl)
makedepends=(git cargo)
provides=(monolith)
conflicts=(monolith)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/+/)+r$(git rev-list --count HEAD)+g$(git describe --always)
}

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname
  install -D target/release/monolith -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
