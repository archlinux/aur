# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-cli-bin
pkgver=2026.3.0
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
sha256sums_x86_64=('0bdf85cfa1ad1e3c4f6cd2ae23d0de1af136939405f1f395b6836b7f43479ed2')
sha256sums_aarch64=('5826f3c4f0c5ff16151c9dccf0a8b245224b943a86c51f1125070bcdcaec1436')

build() {

  # Generate completions
  ./bw completion --shell zsh > _bw
}

package() {
	install -Dm755 bw -t "$pkgdir/usr/bin/"
	install -Dm644 _bw -t "$pkgdir/usr/share/zsh/site-functions/"
}
