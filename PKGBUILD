# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=monolith
pkgver=2.0.16
_commit=02b717ae54b0974ec0181c797214f3c176e9c0e8 # Upstream does not tag releases - cherry-pick has release version in commit message
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(i686 x86_64)
url=https://github.com/Y2Z/monolith
license=(custom)
depends=(openssl)
makedepends=(cargo)
provides=(monolith)
conflicts=(monolith)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha512sums=('48d9e09a0e9a42a9c0e22c36c42fc06f8c84179a0bc353b101cd72102fb3cc0874f5ae89604056255c9d537d747fca80b1ad8f40eab4bb67d882755225a04938')

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
