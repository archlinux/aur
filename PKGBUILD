# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=vape
pkgver=0.2.0
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
_ghrepo_=vape
url="https://github.com/JoshuaRLi/${_ghrepo_}"
license=('MIT')
makedepends=('rust')

source_x86_64=("${url}/archive/v${pkgver}.tar.gz")
sha512sums_x86_64=('d0f566c3f39f73a34fb535bff6f6e3cb2774240a03c35578fd8e051c9a6434fc45aa469404ebc5b6a2a6b637a1a59b7947cc6ce3091ff21e953a4d5717252e4e')

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
