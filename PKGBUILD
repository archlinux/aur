# Maintainer: Conor Anderson <conor[dot]anderson[at]utoronto.ca>
pkgname=pqr
_pkgver="2016-10-24"
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="A pretty quick version of R"
arch=('i686' 'x86_64')
url="http://www.pqr-project.org/"
license=('GPL')
depends=('blas' 'lapack' 'bzip2'  'libtiff' 'pcre' 'libxmu')
makedepends=('gcc-fortran')
optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files')
options=('!makeflags' '!emptydirs')
install=$pkgname.install
source=("http://www.pqr-project.org/pqR-${_pkgver}.tar.gz"
	'pqr.desktop'
	'pqr.png')
sha256sums=('de6ebb98ffde2dae669fc4db25d3d9f65af8a5c523dd305e82b24cb17de3ada7'
            'c22cb2c5c98e8cd9cece75160ceb6edf6850fd84cd1c34f7d1325ac83874211a'
            '281e4b365b164930af35046178e7012d29f1b7aece17a95658ac049d77a05df6')

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
