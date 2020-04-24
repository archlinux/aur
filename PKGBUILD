# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=kibi
pkgver=0.2.0
pkgrel=1
pkgdesc="A tiny text editor, written in Rust"
url="https://github.com/ilai-deutel/kibi"
makedepends=('cargo')
depends=('gcc-libs')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
backup=('etc/kibi/config.ini')
source=("https://github.com/ilai-deutel/kibi/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7af69657ce50816e45e9111138cf9e050f74289bba3ceaa2a52e4715951c8885')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

# check() {
#   cd "$pkgname-$pkgver"
#   cargo test --release --locked
# }

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "target/release/kibi" -t "$pkgdir/usr/bin"

  # Install configuration files
  install -Dm644 "config_example.ini" "$pkgdir/etc/kibi/config.ini"
  install -Dm644 syntax.d/* -t "$pkgdir/usr/share/kibi/syntax.d"

  # Install license
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
