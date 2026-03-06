# Maintainer: Shi Yanling <sylphenix@outlook.com>

pkgname=sff
pkgver=1.3
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
sha256sums=('80736c30fe0150cec98afce2dae835cc5e0e3944d2ed1a618490ea78213b71de')

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
