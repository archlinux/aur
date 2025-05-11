# Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname=ephepm-iaarasru
pkgver=2.3
pkgrel=1
pkgdesc="EphEPM calculates barycentric coordinates of some Solar System bodies "
url="https://github.com/ProfessorNavigator/eph-epm"
license=('GPL-3.0')
arch=('x86_64')
depends=('gtkmm-4.0' 'mathgl' 'gmp')
makedepends=('cmake' 'sofa' 'gcc' 'pkgconf')
source=("https://github.com/ProfessorNavigator/eph-epm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e50ba282856814d20a3fcc07a641a9b1c5f00db0e8a2c00187efd40517217d9')

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

