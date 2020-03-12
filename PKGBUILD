# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=acmed
pkgver=0.7.0
pkgrel=2
pkgdesc="An ACME (RFC 8555) client daemon"
arch=('x86_64')
url="https://github.com/breard-r/acmed/archive/v${pkgver}.tar.gz"
license=('Apache' 'MIT')
depends=('openssl')
makedepends=('rust' 'cargo')
backup=('etc/acmed/acmed.toml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/breard-r/$pkgname/archive/v$pkgver.tar.gz"
        "acmed.service")
sha256sums=('1dac219eb8bc37081505acdbad939d8b1e875fc791c338fb3e0315a393c5f8da'
            '5dbe0f15b41b26224f778750e24f8f5d2fe754ad7baf1e77c5f74f7f38cbe54d')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/acmed.service" "$pkgdir/usr/lib/systemd/system/acmed.service"
  install -Dm644 "LICENSE-APACHE-2.0.txt" "$pkgdir/usr/share/licenses/acmed/LICENSE-APACHE-2.0.txt"
  install -Dm644 "LICENSE-MIT.txt" "$pkgdir/usr/share/licenses/acmed/LICENSE-MIT.txt"
}
