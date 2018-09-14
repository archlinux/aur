# Maintainer: Joshua Li <josh@jrl.ninja>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=vape
pkgver=0.2.2
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
_ghrepo_=vape
url="https://github.com/JoshuaRLi/${_ghrepo_}"
license=('MIT')
makedepends=('rust')

source_x86_64=("${url}/archive/v${pkgver}.tar.gz")
sha512sums_x86_64=('edb41a10e1fba8da3f601c63a44aa56fb2066b23be9341157cf0302170b79da8c84a3bc9d26d6b04b077a3cf41148ae204f7c69700f16b49ae81765fb9bf1b32')

_srcdir_="${_ghrepo_}-${pkgver}"

build () {
  cd "$_srcdir_"
  cargo build --release
}

check () {
  cd "$_srcdir_"
  cargo test --release
}

package () {
  cd "$_srcdir_"
  install -Dm 755 "target/release/vape" "${pkgdir}/usr/bin/vape"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
