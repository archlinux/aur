# Maintainer: Brian Bidulock <bidulock2openss7.org>
# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>
pkgname=svg2pdf-git
pkgver=r6.301dd48
pkgrel=1
pkgdesc="Conversion of SVGs to PDFs via cairo"
epoch=1
arch=('i686' 'x86_64')
url="http://cairographics.org/"
license=('custom')
depends=('librsvg')
makedepends=('git')
provides=('svg2pdf')
conflicts=('svg2pdf')
source=("$pkgname::git://people.freedesktop.org/~cworth/svg2pdf")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
	install -Dm755 svg2pdf "${pkgdir}/usr/bin/svg2pdf"
  head -30 svg2pdf.c >LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 

# vim:set ts=2 sw=2 et:
