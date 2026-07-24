# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-cli-bin
pkgver=2026.7.0
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
sha256sums_x86_64=('7a35145e205952f7434d2370da359543145ae0c45ba1af0fe9bdd99d40a00180')
sha256sums_aarch64=('e33ed05ca0fada9bd51b8bce76a230369bf0eefd5796a0a8e60699c977327fb5')

build() {

  # Generate completions
  ./bw completion --shell zsh > _bw
}

package() {
  install -Dm755 bw -t "$pkgdir/usr/bin/"
  install -Dm644 _bw -t "$pkgdir/usr/share/zsh/site-functions/"
}
