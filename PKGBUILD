# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-cli-bin
pkgver=2026.11.1
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
sha256sums_x86_64=('4c074b8d7a4365075d6628a224f65f29e6797d806b0896850973997464346622')
sha256sums_aarch64=('6e85ed7939414a768a58aa40fff53e2ba79584bb7de73e47b97b206bfb532497')

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
