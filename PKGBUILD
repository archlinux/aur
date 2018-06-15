# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=vape
pkgver=0.2.1
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
_ghrepo_=vape
url="https://github.com/JoshuaRLi/${_ghrepo_}"
license=('MIT')
makedepends=('rust')

source_x86_64=("${url}/archive/v${pkgver}.tar.gz")
sha512sums_x86_64=('cb998702675ab077267f9b87c439e7c8e297e83466503c6eaee5399bcc754437c008d9caa44cc32a09bb66082ddd5a35ea913f05d322a03de990335a6155a5cf')

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
