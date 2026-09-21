pkgname=dogma-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Bridges secrets from vault backends and infrastructure outputs into sops-encrypted files deployed to NixOS machines (binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/dogma"
license=('MIT')
depends=('glibc')
provides=('dogma')
conflicts=('dogma')

source_x86_64=("dogma-x86_64-$pkgver.tar.gz::https://github.com/x71c9/dogma/releases/download/v$pkgver/dogma-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("dogma-aarch64-$pkgver.tar.gz::https://github.com/x71c9/dogma/releases/download/v$pkgver/dogma-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=("c282e04cd517ad0b2e73e05eabbb831c0b4d6278fbbfab359484a1506cec02e0")
sha256sums_aarch64=("bee784ab1bd89e6d08bfc1d1b84ee961a7949ea6953547c67e7eb164622bac10")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "dogma-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "dogma-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "dogma" "$pkgdir/usr/bin/dogma"
  "./dogma" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/dogma"
  "./dogma" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_dogma"
  "./dogma" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/dogma.fish"
}
