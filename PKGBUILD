# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
pkgname=dedrunk-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Kalibr IMU calibration from MCAP recordings."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/stelzo/dedrunk"
license=('MIT' 'Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=()
options=('!lto' '!strip' '!debug')
source_x86_64=(
  "dedrunk-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/dedrunk-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('SKIP')
source_aarch64=(
  "dedrunk-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/dedrunk-$pkgver-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=('SKIP')
provides=('dedrunk')
conflicts=('dedrunk')

build() {
  export DEDRUNK="$srcdir/dedrunk-$pkgver/dedrunk"
  chmod 755 $DEDRUNK

  mkdir -p "$srcdir/completions"
  "$DEDRUNK" completions bash > "$srcdir/completions/bash"
  "$DEDRUNK" completions zsh  > "$srcdir/completions/_zsh"
  "$DEDRUNK" completions fish > "$srcdir/completions/fish"
}

package() {
  install -Dm755 "$srcdir/dedrunk-$pkgver/dedrunk" "$pkgdir/usr/bin/dedrunk"

  install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/dedrunk"
  install -Dm644 "$srcdir/completions/_zsh" "$pkgdir/usr/share/zsh/site-functions/_dedrunk"
  install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/dedrunk.fish"
}
