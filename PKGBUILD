# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=undead
pkgver=0.1.14
pkgrel=1
pkgdesc="A minimal CLI chat client for OpenAI-compatible APIs with workspace and MCP support."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/undead"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('undead')
conflicts=('undead')
options=('!debug')
backup=('etc/undead/config.yml')

source=('LICENSE' 'config.yml')
source_x86_64=("undead-x86_64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/undead-linux-x86_64")
source_aarch64=("undead-aarch64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/undead-linux-aarch64")

sha256sums=('184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c'
            '65643b871c9c519bd8ea7d9986b8cd999105741dc708f75f3923462a02b5c35e')
sha256sums_x86_64=('4e21d8eda1081df770f9b2a20a3610081c7893224116bc2f961142d66773dac9')
sha256sums_aarch64=('fb64f03f3a8ad486c0f350386084aa574d1239e538263e809783becc2d8d71bb')

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
