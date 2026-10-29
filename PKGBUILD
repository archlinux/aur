# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-cli-bin
pkgver=2026.10.1
pkgrel=1
pkgdesc="The command line vault"
arch=('x86_64' 'aarch64')
url="https://bitwarden.com"
license=('GPL-3.0-only')
depends=(
  'libgcc'
  'libstdc++'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source_x86_64=("https://github.com/bitwarden/clients/releases/download/cli-v$pkgver/bw-linux-$pkgver.zip")
source_aarch64=("https://github.com/bitwarden/clients/releases/download/cli-v$pkgver/bw-linux-arm64-$pkgver.zip")
sha256sums_x86_64=('eb09c3715291c21cf744819b873a255c1247b1b8b45bae138621a644ec7ad8f5')
sha256sums_aarch64=('79ecb3293fb259660961c949d3e32fdab8682b2bcff0f6764ce38a411ca1ac5d')

build() {

  # Generate completions
  ./bw completion --shell zsh > _bw
}

package() {
  install -Dm755 bw -t "$pkgdir/usr/bin/"
  install -Dm644 _bw -t "$pkgdir/usr/share/zsh/site-functions/"
}
