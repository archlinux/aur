# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=acmed
pkgver=0.11.0
pkgrel=1
pkgdesc="An ACME (RFC 8555) client daemon"
arch=('x86_64')
url="https://github.com/breard-r/acmed/"
license=('Apache' 'MIT')
depends=('openssl')
makedepends=('rust' 'cargo')
backup=('etc/acmed/acmed.toml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/breard-r/$pkgname/archive/v$pkgver.tar.gz"
        "acmed.service")
sha256sums=('c1bc7ba770a3f2b96e70af123ef69efcadbb9b473a2c112cd86470a42b7f7fcd'
            '41d96853da7de90f66ae89cba4ffa59360587ea79bdc39e0710935de9eee0afe')

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
