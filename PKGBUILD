pkgname=dogma-bin
pkgver=3.2.2
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

sha256sums_x86_64=("305ee0ca241ada33f584ab4f41d69ba662890df549fba6d2428e2ee1e4c285f2")
sha256sums_aarch64=("1ff0517ebd80b9368003388a7d6f79b5035d41284992e328f694c50215abad4c")

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
