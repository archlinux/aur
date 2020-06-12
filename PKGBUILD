# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=acmed
pkgver=0.8.0
pkgrel=1
pkgdesc="An ACME (RFC 8555) client daemon"
arch=('x86_64')
url="https://github.com/breard-r/acmed/archive/v${pkgver}.tar.gz"
license=('Apache' 'MIT')
depends=('openssl')
makedepends=('rust' 'cargo')
backup=('etc/acmed/acmed.toml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/breard-r/$pkgname/archive/v$pkgver.tar.gz"
        "acmed.service")
sha256sums=('b9e852c73fe39092c617bde6330fe8b1f02fdd4df11deb8fe4c2b6d1624f402a'
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
