# Maintainer:
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=latex2rtf
pkgver=2.3.18
pkgrel=1
pkgdesc="LaTeX to RTF converter"
arch=('x86_64')
url="http://latex2rtf.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('bash' 'ghostscript' 'glibc' 'imagemagick')
makedepends=('texlive-bin')
checkdepends=('texlive-fontsrecommended' 'texlive-latexextra')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}a.tar.gz")
sha512sums=('b6caef616e8e63e8779a86dae6cbe0993de5421bd6700fe9118bee2af528c496c0e849ae5315ed6fc86be6c7fbe7fa073e41b39e8c5da2da4e65b26784135589')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr latex2rtf
}

check() {
  cd "${pkgname}-${pkgver}"
  RTFPATH="${PWD}/cfg" make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install install-info
}
