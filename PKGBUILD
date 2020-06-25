# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=wasmer-bin
pkgver=0.17.1
pkgrel=0
pkgdesc='Universal WebAssembly runtime'
arch=(x86_64)
license=(MIT)
url='https://wasmer.io/'
depends=(bash)
conflicts=(wasmer wapm)
provides=(wasmer wapm)
source=(
  "wasmer-linux-amd64-${pkgver}.tar.gz"::"https://github.com/wasmerio/wasmer/releases/download/${pkgver}/wasmer-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/wasmerio/wasmer/${pkgver}/LICENSE"
  logo.sh
)
sha512sums=(SKIP SKIP SKIP)

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
  install -Dm755 bin/wapm "$pkgdir"/usr/bin/wapm
  ln -s wapm "$pkgdir"/usr/bin/wax

  # wapm completions
  install -Dm644 wapm-bash-completions "$pkgdir"/usr/share/bash-completion/completions/wapm
  install -Dm644 wapm-zsh-completions "$pkgdir"/usr/share/zsh/site-functions/_wapm

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
