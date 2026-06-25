# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-cli-bin
pkgver=2026.6.0
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
sha256sums_x86_64=('392549496c712ab86bfbd6c27302df9fd2c431cfc7a47e26941ac3e3893f4d27')
sha256sums_aarch64=('626156e0ca60606c85b5b8ede0dd4e546b886a36e7f827b81d8cd5b8b487ee7c')

build() {

  # Generate completions
  ./bw completion --shell zsh > _bw
}

package() {
  install -Dm755 bw -t "$pkgdir/usr/bin/"
  install -Dm644 _bw -t "$pkgdir/usr/share/zsh/site-functions/"
}
