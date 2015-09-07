# Maintainer: Steven Vancoillie <steven<dot>vancoillie[at]gmail[dot]com>
pkgname=likwid
pkgver=4.0.0
pkgrel=1
pkgdesc="Lightweight performance tools"
url="https://github.com/rrze-likwid/likwid"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
makedepends=()
optdepends=('perl: for likwid-mpirun and likwid-perfscope'
            'openmpi: for likwid-mpirun'
            'gnuplot: for likwid-perfscope')
conflicts=()
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('e59637cf208301f7176239c4c4376b41')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  sed -i "12s:/usr/local:/usr:; 13s:/man:/share/man:; 18s:/sbin:/bin:" config.mk 
  sed -i "s:/sbin:/bin:" Makefile
  make
  
  if [[ ${CARCH} == x86_64 ]]
  then
	  make likwid-bench
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install 
}
