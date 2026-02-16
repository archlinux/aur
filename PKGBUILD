# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=undead
pkgver=0.1.9
pkgrel=1
pkgdesc="A minimal CLI chat client for OpenAI-compatible APIs with workspace and MCP support."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/undead"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('undead')
conflicts=('undead')
options=('!debug')

source=('LICENSE' 'config.yml')
source_x86_64=("undead-x86_64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/undead-linux-x86_64")
source_aarch64=("undead-aarch64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/undead-linux-aarch64")

sha256sums=('184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c'
            '65643b871c9c519bd8ea7d9986b8cd999105741dc708f75f3923462a02b5c35e')
sha256sums_x86_64=('d7b034ea25f36dbc694f74a35a09c24744835cc0a5a9e3c19a728df96836a7d6')
sha256sums_aarch64=('fe47d500771fe1754e7117d633ba67f73098214d487d9fb0191840356d1b476d')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _bin="undead-x86_64-$pkgver-$pkgrel"
  elif [ "$CARCH" == "aarch64" ]; then
    _bin="undead-aarch64-$pkgver-$pkgrel"
  fi

  # Binaries and Service
  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/undead"

  # Config
  install -Dm644 "$srcdir/config.yml" "$pkgdir/etc/undead/config.yml"

  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
