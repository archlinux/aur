# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=monolith
pkgver=2.0.23
_commit=491185e191b09051f25ca5a0809ee576e42a9d44 # Untagged release
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(x86_64 aarch64)
url=https://github.com/Y2Z/monolith
license=(custom:Unlicese)
depends=(openssl)
makedepends=(cargo)
provides=(monolith)
conflicts=(monolith)
source=($pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha512sums=('e507b4639d908457b167b6910196ceb066441527c59bb6737a57327dd97943c2a5673c67b35442cd1f354d67f3c97d2e4b8da4e79ec3ed35e95878ab91dbd78e')

build() {
  cd $pkgname-$_commit
  cargo build --release
}

package() {
  cd $pkgname-$_commit
  install -D target/release/monolith -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
