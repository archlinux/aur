# Maintainer: Conor Anderson <conor[dot]anderson[at]utoronto.ca>
pkgname=pqr
_pkgver="2015-09-14"
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
md5sums=('5f1f65f3c71f2f27c33c2901417bcbfe'
         '543264e50f64a1c5bdf1465e3961b188'
         '8a535cb19598efcf31a5e757b6d74217')

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
