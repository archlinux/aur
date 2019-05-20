# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=acmed
pkgver=0.5.0
pkgrel=4
pkgdesc="An ACME (RFC 8555) client daemon"
arch=('x86_64')
url="https://github.com/breard-r/acmed/archive/v${pkgver}.tar.gz"
license=('Apache' 'MIT')
depends=('openssl')
makedepends=('rust' 'cargo')
backup=('etc/acmed/acmed.toml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/breard-r/$pkgname/archive/v$pkgver.tar.gz"
        "acmed.service")
md5sums=('0356a1a3136b6ce6a724907f08e8fd21'
         'dd3c3e98dc5fed641be25237dbd1103d')

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
