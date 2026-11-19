# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-cli-bin
pkgver=2026.11.0
pkgrel=1
pkgdesc="The command line vault"
arch=('x86_64' 'aarch64')
url="https://bitwarden.com"
license=('GPL-3.0-only AND LicenseRef-Bitwarden-License-v1.0')
depends=(
  'libgcc'
  'libstdc++'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("LICENSE_BITWARDEN-$pkgver.txt::https://raw.githubusercontent.com/bitwarden/clients/refs/tags/cli-v$pkgver/LICENSE_BITWARDEN.txt")
source_x86_64=("https://github.com/bitwarden/clients/releases/download/cli-v$pkgver/bw-bit-linux-$pkgver.zip")
source_aarch64=("https://github.com/bitwarden/clients/releases/download/cli-v$pkgver/bw-bit-linux-arm64-$pkgver.zip")
sha256sums=('955ba776275f22852e50034ca83acff1e9fffea58e7ffde9f5d1b0c6f0bce79a')
sha256sums_x86_64=('bfc7643cbc20f970bf04b994f96489703fcf77217a2384f1743e43848363b0ba')
sha256sums_aarch64=('39e8336376739bbe5306471df0667793757ef1e243df3846461f66be9166e9d8')

build() {

  # Generate completions
  ./bw completion --shell zsh > _bw
}

package() {
  install -Dm755 bw -t "$pkgdir/usr/bin/"
  install -Dm644 _bw -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 LICENSE_BITWARDEN-$pkgver.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE_BITWARDEN.txt"
}
