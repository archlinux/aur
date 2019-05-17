# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=wasmer-bin
pkgver=0.4.2
pkgrel=0
pkgdesc='Universal WebAssembly runtime'
arch=(x86_64)
license=(MIT)
url='https://wasmer.io/'
depends=(bash)
conflicts=(wasmer wapm)
provides=(wasmer wapm)
source=(
  "https://github.com/wasmerio/wasmer/releases/download/${pkgver}/wasmer-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/wasmerio/wasmer/${pkgver}/LICENSE"
  wapm.sh
  logo.sh
)
sha512sums=(SKIP SKIP SKIP SKIP)

build() {
  cd "$srcdir"

  # wapm completions
  ./bin/wapm completions bash > wapm-bash-completions
  ./bin/wapm completions zsh > wapm-zsh-completions
}

package() {
  cd "$srcdir"

  # display logo
  source logo.sh

  # executable commands
  install -Dm755 bin/wasmer "$pkgdir"/usr/bin/wasmer
  install -Dm755 wapm.sh "$pkgdir"/usr/bin/wapm.sh
  install -Dm755 bin/wapm "$pkgdir"/usr/bin/wapm.bin
  ln -s wapm.sh "$pkgdir"/usr/bin/wapm

  # wapm completions
  install -Dm644 wapm-bash-completions "$pkgdir"/usr/share/bash-completion/completions/wapm
  install -Dm644 wapm-zsh-completions "$pkgdir"/usr/share/zsh/site-functions/_wapm

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
