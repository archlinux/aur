# Maintainer Yury Bobylev <bobilev_yury@mail.ru>
_pkgname=eph-epm
pkgname=ephepm-iaarasru
pkgver=2.2
pkgrel=1
pkgdesc="EphEPM calculates barycentric coordinates of some Solar System bodies "
url="https://github.com/ProfessorNavigator/eph-epm"
license=('GPL3')
arch=('x86_64')
depends=('gtkmm-4.0' 'mathgl' 'gmp' 'icu')
makedepends=('cmake' 'mathgl' 'gtkmm-4.0' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ProfessorNavigator/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a586ca59a267c7f6e3f41444a9de1b53d68994e39094b7c022f085330352c751')

build() {  	
  	mkdir -p $srcdir/builddir
  	cd $srcdir/eph-epm-$pkgver   
  	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_OPENMP=on -B $srcdir/builddir
 	cd $srcdir/builddir
 	make -j$(nproc) 
}

package() {
	cd $srcdir/builddir
  	DESTDIR="$pkgdir" make install
}

