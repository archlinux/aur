# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-cli-bin
pkgver=2026.4.1
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
sha256sums_x86_64=('2172dc63f821fcbd4b4ce65e7106f1ebab26b6cb16c9c8a5b28230dcc6f8a774')
sha256sums_aarch64=('c405867e5e2df08f82e1893561094fb7e5ef7caf957ba5ded9fbe870b2ef4380')

build() {

  # Generate completions
  ./bw completion --shell zsh > _bw
}

package() {
  install -Dm755 bw -t "$pkgdir/usr/bin/"
  install -Dm644 _bw -t "$pkgdir/usr/share/zsh/site-functions/"
}
