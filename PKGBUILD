# Maintainer: ByteDream
pkgname=crunchy-cli
pkgdesc="Command-line downloader for Crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('MIT')

pkgver=3.3.3
pkgrel=1

depends=('ffmpeg' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crunchy-labs/crunchy-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6005386eb471a0c35b277e82028fef6db777f876b2691ed30bcc41b0f63e3740')

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
