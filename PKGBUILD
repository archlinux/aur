# Maintainer: ByteDream
pkgname=crunchy-cli
pkgdesc="Command-line downloader for Crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('MIT')

pkgver=3.2.1
pkgrel=1

depends=('ffmpeg' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crunchy-labs/crunchy-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c34fa148b114d427fb1d1182a8b7a20fb7188b547135bb8cb0a734b83f823e5f')

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  install -Dm755 target/release/crunchy-cli $pkgdir/usr/bin/crunchy-cli
  install -Dm644 target/release/manpages/* -t $pkgdir/usr/share/man/man1
  install -Dm644 target/release/completions/crunchy-cli.bash $pkgdir/usr/share/bash-completion/completions/crunchy-cli
  install -Dm644 target/release/completions/_crunchy-cli $pkgdir/usr/share/zsh/site-functions/_crunchy-cli
  install -Dm644 target/release/completions/crunchy-cli.fish $pkgdir/usr/share/fish/vendor_completions.d/crunchy-cli.fish
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/crunchy-cli/LICENSE
}
