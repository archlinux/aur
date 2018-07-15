# Maintainer: Steven Vancoillie <steven<dot>vancoillie[at]gmail[dot]com>
pkgname=likwid
pkgver=4.3.2
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
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('2cf00e220dfe22c8d9b6e44f7534e11d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "13s:/usr/local:/usr:; 41s:/man:/share/man:; 58s:/sbin:/bin:; 59s:/sbin:/bin:" config.mk 
  sed -i "s:/sbin:/bin:" Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install 
}
