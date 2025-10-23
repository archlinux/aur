# Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname=ephepm-iaarasru
pkgver=2.3.2
pkgrel=1
pkgdesc="EphEPM calculates barycentric coordinates of some Solar System bodies "
url="https://github.com/ProfessorNavigator/eph-epm"
license=('GPL-3.0')
arch=('x86_64')
depends=('gtkmm-4.0' 'mathgl' 'gmp')
makedepends=('cmake' 'sofa' 'gcc' 'pkgconf')
source=("https://github.com/ProfessorNavigator/eph-epm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('54ce7632739e40f7d0fc9859fd9fbb5c798520b209185ae521b8b8c05e5fc856')

build() {  	
  	local cmake_options=(
    -B build
    -S eph-epm-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build --parallel $(nproc)
}

package() {
	DESTDIR=$pkgdir cmake --install build
	install -D -m644 "eph-epm-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

