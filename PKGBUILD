#Maintainer: Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mylibrary"
pkgver="5.0"
pkgrel="1"
pkgdesc="Home librarian"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mylibrary"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc' 'doxygen' 'qt6-tools')
depends=('qt6-base' 'icu' 'libgcrypt' 'poppler' 'djvulibre' 'libarchive' 'imagemagick' 'libudb')
sha256sums=('021a6fe429c6dc7f66f95dbdb04e90109d8eb6bee84ac42afb5eb21313e60d6c')

build() {   
   local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_MLPLUGIN_DOCS=ON
    -D CREATE_DOCS_XMLPARSERCPP=ON
    -D BUILD_MLBOOKPROC_DOCS=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build --parallel $(nproc)
}

package() {
    DESTDIR=$pkgdir cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
