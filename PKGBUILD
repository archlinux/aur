# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

pkgname=dabadee
pkgver=0.6.0
pkgrel=1
pkgdesc="DaBaDee is a simple deduplication tool/storage for files. It uses SHA256* to hash the files and store them in the storage, replacing the original path with a hardlink to the storage location."
arch=(any)
url="https://github.com/mirkobrombin/DaBaDee"
license=(MIT)
source=("https://github.com/mirkobrombin/DaBaDee/releases/download/v${pkgver}/dabadee")
sha256sums=('9c702ebecbc06510fb28414db22b9cb71e646cad9b0472351606cf04471ae982')

build() {
  chmod +x ./dabadee

  ./dabadee completion bash > dabadee.bash
  ./dabadee completion zsh > dabadee.zsh
  ./dabadee completion fish > dabadee.fish
}

package() {
  install -D -m755 ./dabadee "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 ./dabadee.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -D -m644 ./dabadee.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -D -m644 ./dabadee.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
