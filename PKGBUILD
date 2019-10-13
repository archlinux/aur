# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=acmed
pkgver=0.6.1
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
sha256sums=('f30b1e00e0dca9e597e0048db3efb798a31bc94fd4430029c39e92ceb22f7d64'
            '7ee439e5415bbbfeebfc563d0e4fdeba4ed3666e631b21b6eeac3607d36de1da')

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
