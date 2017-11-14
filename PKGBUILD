# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=libctl-git
pkgver=3.2.2.r20.ga1bde30
pkgrel=1
pkgdesc='Guile-based library implementing flexible control files for scientific simulations'
arch=('i686' 'x86_64')
url='https://github.com/stevengj/libctl'
license=('GPL2')
depends=('guile' 'gcc-fortran')
options=('!libtool')
provides=('libctl')
conflicts=('libctl')
source=('git+https://github.com/stevengj/libctl.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/libctl"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/libctl"
	sed -i '/unknown argument/d' autogen.sh
  #./autogen.sh F77=gfortran CC=gcc CXX=g++ LIBS='-lm' GUILE='/usr/bin/guile2.0' GUILE_CONFIG='/usr/bin/guile-config2.0' --prefix=/usr --enable-shared
  #./autogen.sh F77=gfortran CC=gcc CXX=g++ LIBS='-lm' --prefix=/usr --enable-shared
  ./autogen.sh LIBS='-lm' --prefix=/usr --enable-shared
  make 
}

package() {
  cd "${srcdir}/libctl"
  make DESTDIR=${pkgdir} install
}
