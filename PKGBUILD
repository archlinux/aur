# Maintainer: Remco Stoeten <stoetenremco.rs@gmail.com>

pkgname=dora
pkgver=0.45.0
pkgrel=1
pkgdesc='Free, open source database client for PostgreSQL, MySQL, MariaDB, CockroachDB, SQLite, libSQL/Turso, Cloudflare D1 and DuckDB (prebuilt binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/remcostoeten/dora'
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'openssl' 'libsoup3')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/remcostoeten/dora/releases/download/v${pkgver}/dora-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/remcostoeten/dora/releases/download/v${pkgver}/dora-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5a89df1ee18380ec9144fa423813adc2b15853efaa1a55e57cd0766e03fbddcd')
sha256sums_aarch64=('ec22526b180a06ada3681f65ea5b44eb883bd0b19bf79e69e0d1381f0bdcd4b9')

package() {
  cd "$srcdir/dora-${CARCH}-unknown-linux-gnu"

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
