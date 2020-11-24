# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=fortune-mod-grugq
pkgver=r10.888d79a
pkgrel=1
pkgdesc="Fortune Quotes: The Grugq"
arch=('any')
license=('custom')
depends=('fortune-mod')
url="https://github.com/grugq/quotes"
source=('grugq-quotes::git+https://github.com/grugq/quotes.git')
sha256sums=('SKIP')

pkgver() {
  cd "grugq-quotes"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "grugq-quotes"
  mv quotes_gq.fortune the_grugq
  strfile the_grugq the_grugq.dat
}

package() {
  cd "grugq-quotes"
  install -D -m644 the_grugq "${pkgdir}/usr/share/fortune/the_grugq"
  install -D -m644 the_grugq.dat "${pkgdir}/usr/share/fortune/the_grugq.dat"
}

