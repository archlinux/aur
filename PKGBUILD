# Maintainer: Steven Vancoillie <steven<dot>vancoillie[at]gmail[dot]com>
pkgname=likwid
pkgver=4.0.1
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
md5sums=('adbb3f3892113ad5c00a3e42c6bb3a7c')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  sed -i "12s:/usr/local:/usr:; 13s:/man:/share/man:; 31s:/sbin:/bin:; 32s:/sbin:/bin:" config.mk 
  sed -i "s:/sbin:/bin:" Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install 
}
