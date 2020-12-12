# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kbs2-bin
pkgver=0.2.4
pkgrel=2
pkgdesc="A secret manager backed by age"
arch=('x86_64')
url="https://github.com/woodruffw/kbs2"
license=('MIT')
depends=('libx11')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-linux-v${pkgver}.tar.gz")
sha256sums_x86_64=('f4c7bea4e49fa9382b849c20037c7f3a71a2ba9e0d94a69e33c87bc79f7b2140')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  "./${pkgname%-bin}" --completions bash | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
  "./${pkgname%-bin}" --completions fish | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/fish/completions/${pkgname%-bin}.fish"
  "./${pkgname%-bin}" --completions zsh | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
}
