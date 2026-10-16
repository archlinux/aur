# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-cli-bin
pkgver=2026.10.0
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
sha256sums_x86_64=('269b67559caab860d1737f7554b32bdb8be9285d5689fee55193c137a0df9973')
sha256sums_aarch64=('2fe9d8a18dc4c35ea2f9e3e42a4021f14f129ef47e80b6cea1e3b34176f1583a')

build() {

  # Generate completions
  ./bw completion --shell zsh > _bw
}

package() {
  install -Dm755 bw -t "$pkgdir/usr/bin/"
  install -Dm644 _bw -t "$pkgdir/usr/share/zsh/site-functions/"
}
