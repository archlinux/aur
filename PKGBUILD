# Maintainer: Remco Stoeten <stoetenremco.rs@gmail.com>

pkgname=dora
pkgver=0.43.0
pkgrel=1
pkgdesc='Free, open source database client for PostgreSQL, MySQL, MariaDB, CockroachDB, SQLite, libSQL/Turso, Cloudflare D1 and DuckDB (prebuilt binary release)'
arch=('x86_64')
url='https://github.com/remcostoeten/dora'
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'openssl' 'libsoup3')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/remcostoeten/dora/releases/download/v${pkgver}/dora-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('962dd019b5358edf7966bae5c3a16fd66e9d4106e9abf21f1aaead27d6cb16f8')

package() {
  cd "$srcdir/dora-x86_64-unknown-linux-gnu"

  install -Dm755 dora "$pkgdir/usr/bin/dora"

  # DuckDB runs in a helper process resolved next to the main binary; without it
  # every DuckDB and data-file connection fails to open.
  install -Dm755 duckdb_helper "$pkgdir/usr/bin/duckdb_helper"

  if [[ -f dora.desktop ]]; then
    install -Dm644 dora.desktop "$pkgdir/usr/share/applications/dora.desktop"
  fi

  if [[ -f icons/32x32.png ]]; then
    install -Dm644 icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/dora.png"
  fi

  if [[ -f icons/128x128.png ]]; then
    install -Dm644 icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/dora.png"
  fi
}
