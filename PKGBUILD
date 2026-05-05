#Maintainer: Yury Bobylev <bobilev_yury@mail.ru>
pkgname="libudb"
pkgver="1.0"
pkgrel="1"
pkgdesc="Universal DataBase library"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/libudb"
license=('GPL-3.0-only')
makedepends=('cmake' 'gcc' 'doxygen')
sha256sums=('e4b4217d2f0b9ba7918a4809d0a80510438c66eaa92440957d64c7fb0d311f7f')

build() {   
   local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_DOCS=ON
  )
  cmake "${cmake_options[@]}"  
  cmake --build build --parallel $(nproc)
  cmake --build build --target test
}

package() {
    DESTDIR=$pkgdir cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
