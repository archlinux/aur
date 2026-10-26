# Maintainer: stelzo <stelzo@steado.de>
pkgname=ratslang-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Configuration language for building physical systems in Rust: CLI and language server"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/ratslang"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
options=('!lto' '!strip' '!debug')
source_x86_64=("$pkgname-$pkgver.deb::https://ppa.steado.tech/ubuntu/pool/main/noble/ratslang_$pkgver-1_amd64.deb")
sha256sums_x86_64=('SKIP')
source_aarch64=("$pkgname-$pkgver.deb::https://ppa.steado.tech/ubuntu/pool/main/noble/ratslang_$pkgver-1_arm64.deb")
sha256sums_aarch64=('SKIP')
noextract=("$pkgname-$pkgver.deb")
provides=('ratslang')
conflicts=('ratslang')

prepare() {
  mkdir -p "$srcdir/ratslang-ext"
  cd "$srcdir/ratslang-ext"
  bsdtar -xf "$srcdir/$pkgname-$pkgver.deb"
  tar -xpf data.tar.*
}

package() {
  install -Dm755 "$srcdir/ratslang-ext/usr/bin/ratslang" "$pkgdir/usr/bin/ratslang"
  install -Dm755 "$srcdir/ratslang-ext/usr/bin/ratslang-lsp" "$pkgdir/usr/bin/ratslang-lsp"
  install -Dm644 "$srcdir/ratslang-ext/usr/share/doc/ratslang/README.md" "$pkgdir/usr/share/doc/ratslang/README.md"
}
