# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kbs2-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A secret manager backed by age"
arch=('x86_64')
url="https://github.com/woodruffw/kbs2"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-linux-v${pkgver}.tar.gz")
sha256sums_x86_64=('58480a61d5a04523f186d51954fdfc449ba729eeb2eb228e9303a4eba1d6c727')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  "${pkgname%-bin}" --completions bash | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
  "${pkgname%-bin}" --completions fish | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/fish/completions/${pkgname%-bin}.fish"
  "${pkgname%-bin}" --completions zsh | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
}
