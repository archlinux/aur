# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=sounding-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A SLAM evaluation tool."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/sounding"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=()
options=('!lto' '!strip' '!debug')
source_x86_64=(
  "sounding-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/sounding-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('SKIP')
source_aarch64=(
  "sounding-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/sounding-$pkgver-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=('SKIP')
provides=('sounding')
conflicts=('sounding')

build() {
  export SOUNDING="$srcdir/sounding-$pkgver/sounding"
  chmod 755 $SOUNDING

  mkdir -p "$srcdir/completions"
  "$SOUNDING" completions bash > "$srcdir/completions/bash"
  "$SOUNDING" completions zsh  > "$srcdir/completions/_zsh"
  "$SOUNDING" completions fish > "$srcdir/completions/fish"
}

package() {
  install -Dm755 "$srcdir/sounding-$pkgver/sounding" "$pkgdir/usr/bin/sounding"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/sounding"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_sounding"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/sounding.fish"
}
