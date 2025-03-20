# Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname=ephepm-iaarasru
pkgver=2.2
pkgrel=2
pkgdesc="EphEPM calculates barycentric coordinates of some Solar System bodies "
url="https://github.com/ProfessorNavigator/eph-epm"
license=('GPL3')
arch=('x86_64')
depends=('gtkmm-4.0' 'mathgl' 'gmp' 'icu')
makedepends=('cmake' 'mathgl' 'sofa' 'gtkmm-4.0' 'gcc')
source=("https://github.com/ProfessorNavigator/eph-epm/archive/refs/tags/v2.2.tar.gz"
		"icu-uc.patch")
sha256sums=('a586ca59a267c7f6e3f41444a9de1b53d68994e39094b7c022f085330352c751'
			'32399fcbaeade18b14e41ca28911066c6db9cbaad6c7c0c4b09c210a93c1c247')

prepare() {
	cd eph-epm-$pkgver
	patch -Np1 -i ../icu-uc.patch
}

build() {  	
  	cd $srcdir/eph-epm-$pkgver
  	cmake -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_OPENMP=on \
		-B $srcdir/builddir
  	cmake --build $srcdir/builddir --parallel $(nproc)
}

package() {
  	DESTDIR="$pkgdir" cmake --install $srcdir/builddir
}

