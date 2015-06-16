# Maintainer: Steven Vancoillie <steven<dot>vancoillie[at]gmail[dot]com>
pkgname=likwid
pkgver=3.1.3
pkgrel=2
pkgdesc="Lightweight performance tools"
url="http://likwid.googlecode.com"
_url="ftp://ftp.fau.de/pub/likwid/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
makedepends=()
optdepends=('perl: for likwid-mpirun and likwid-perfscope'
            'openmpi: for likwid-mpirun'
            'gnuplot: for likwid-perfscope')
conflicts=()
source=("${_url}/${pkgname}-${pkgver}.tar.gz")
md5sums=('7fbe4f306e86bb475de231087129b33f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "12s:/usr/local:/usr:; 13s:/man:/share/man:; 18s:/sbin:/bin:" config.mk 
  sed -i "s:/sbin:/bin:" Makefile
  make
  
  if [[ ${CARCH} == x86_64 ]]
  then
	  make likwid-bench
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install 
}
