# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>
pkgname=mercurio-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Apprise-compatible Rust library, CLI and HTTP server to send notifications to 150+ services via a single URL."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AlphaJack/mercurio"
license=('Apache-2.0')
provides=('mercurio')
conflicts=('mercurio')
options=('!strip' '!debug')
backup=('etc/mercurio/mercurio.env')
source_x86_64=("$pkgname-$pkgver-x86_64-unknown-linux-musl.tar.xz::$url/releases/download/v$pkgver/mercurio-cli-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("$pkgname-$pkgver-aarch64-unknown-linux-musl.tar.xz::$url/releases/download/v$pkgver/mercurio-cli-aarch64-unknown-linux-musl.tar.xz")
source_armv7h=("$pkgname-$pkgver-armv7-unknown-linux-musleabihf.tar.xz::$url/releases/download/v$pkgver/mercurio-cli-armv7-unknown-linux-musleabihf.tar.xz")
b2sums_x86_64=('054d6cc870e4e2a803f016513a58246d6cf0e4e305619841fce9aa56ff69bb480e4e1ae54832e498c6e6ca21da3013819e91af174dc9e03a1a6e912bd98789ed')
b2sums_aarch64=('58e80d1b5e90827a28a1484ca63a1d7eebc20b11f6c9bd25051bc4a94bb12f9cefc7639e755cad16eeb472af671ab0bbe854e56871f3d7896871347662b5886f')
b2sums_armv7h=('60a7fb569965e1af5d7b1db2afd953d4a6ede17151904bcd1541675c6f329b742443b02080bd93b46700d690a618e0c1bfbdb04f45c89e966a9d2e495efb74d4')

package() {
  local target
  case "$CARCH" in
    "x86_64") target="x86_64-unknown-linux-musl" ;;
    "aarch64") target="aarch64-unknown-linux-musl" ;;
    "armv7h") target="armv7-unknown-linux-musleabihf" ;;
  esac
  cd "$srcdir/mercurio-cli-$target"
  install -Dm755 mercurio "$pkgdir/usr/bin/mercurio"
  install -Dm644 mercurio.service "$pkgdir/usr/lib/systemd/system/mercurio.service"
  install -Dm600 mercurio.env "$pkgdir/etc/mercurio/mercurio.env"
}
