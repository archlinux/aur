# Maintainer: Remco Stoeten <stoetenremco.rs@gmail.com>

pkgname=dora
pkgver=0.41.1
pkgrel=1
pkgdesc='Dora desktop database client (prebuilt binary release)'
arch=('x86_64')
url='https://github.com/remcostoeten/dora'
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'openssl' 'libsoup3')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/remcostoeten/dora/releases/download/v${pkgver}/dora-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('ae6e667a815d2b2e46be60ecb8d0178cde2bcb2b8f99ebe70642ce7bcde913e7')

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
