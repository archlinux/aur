# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=menyoki-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Screen{shot,cast} and perform ImageOps on the command line"
arch=('x86_64')
url="https://github.com/orhun/menyoki"
license=('GPL3')
depends=('libx11')
optdepends=('slop: area selection support')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-x86_64-unknown-linux-gnu.tar.gz"{,.sig})
sha512sums_x86_64=('64926b95429f77af194137a990e8c11e28cdbf1890485ae2d7ef240822c6e3f9ef696a0db8540a693ffb94c64b3dfd00b434213c6961143416f7f26406e0facb'
                   'SKIP')
validpgpkeys=('9965F7E78C54A004D475D6FA53F218C35C1DC8B1') # menyoki <menyoki.cli@protonmail.com>

package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "man/${pkgname%-bin}.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "man/${pkgname%-bin}.conf.5" -t "$pkgdir/usr/share/man/man5"
  install -Dm 644 "completions/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
  install -Dm 644 "completions/${pkgname%-bin}.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "completions/${pkgname%-bin}.zsh" "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_${pkgname%-bin}"
}
