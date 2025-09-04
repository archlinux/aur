# Maintainer: Shi Yanling <sylphenix@outlook.com>

pkgname=sff
pkgver=1.2
pkgrel=1
pkgdesc='Simple and fast terminal file manager'
arch=('x86_64')
url='https://codeberg.org/sylphenix/sff'
license=('BSD-2-Clause')
depends=('ncurses')
optdepends=(
  'xdg-utils: file opening with default application'
  '7zip: additional archive format support'
  'fzf: fuzzy file search'
  'chafa: image preview'
  'poppler: PDF thumbnail generation'
  'ffmpegthumbnailer: video thumbnail generation'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('09731b27f6e9d6e9700a38ed24acc749b2972d139535be9394f87e83e9ad894b')

build() {
  cd "${pkgname}"
  make CFLAGS="${CFLAGS} -std=c11" LDFLAGS="${LDFLAGS} -lncursesw"
}

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -m 644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  install -m 644 -Dt "${pkgdir}/usr/share/doc/${pkgname}/" CHANGELOG.md README.md
}
