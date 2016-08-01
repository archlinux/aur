# Maintainer: Conor Anderson <conor[dot]anderson[at]utoronto.ca>
pkgname=pqr
_pkgver="2016-06-24"
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="a pretty quick version of R"
arch=('i686' 'x86_64')
url="http://www.pqr-project.org/"
license=('GPL')
depends=('blas' 'lapack' 'bzip2'  'libpng' 'libjpeg' 'libtiff'
         'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs'
         'libxt' 'libxmu' 'pango' 'xz' 'desktop-file-utils' 'zip' 'unzip')
makedepends=('gcc-fortran')
optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files')
options=('!makeflags' '!emptydirs')
install=$pkgname.install
source=("http://www.pqr-project.org/pqR-${_pkgver}.tar.gz"
	'pqr.desktop'
	'pqr.png')
sha1sums=('0e8c694412bb73fce4dbe28873a5f9ac8b1ebebd'
         'cdc48b06aaeeea8850b5b12583950581726bef02'
         'fd2c3e142d2c9fd11f95a89c8ab5d3e980db29dd')

build() {
  cd "pqR-${_pkgver}"
  ./configure --prefix=/opt/pqr --enable-R-shlib
  make
}

package() {
  cd "pqR-${_pkgver}"

  make DESTDIR="${pkgdir}/" install

  # install some freedesktop.org compatibility (borrowed form r-devel)
  install -Dm644 "${srcdir}/pqr.desktop" \
	"${pkgdir}/usr/share/applications/pqr.desktop"
  install -Dm644 "${srcdir}/pqr.png" \
	"${pkgdir}/opt/pqr/pqr.png"
}
