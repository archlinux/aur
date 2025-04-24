#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mlinpxplugin"
pkgver="1.0"
pkgrel="1"
pkgdesc="MyLibrary plugin for .inpx collections import"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mylibrary"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc')
depends=('mylibrary')
sha256sums=('3fdbdc2ab1a0b97d33bc077b69a0f7ba47cf258744d6d157c125645a259dd53f')

build() {   
   local cmake_options=(
        -B build
        -S $pkgname-$pkgver
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build --parallel $(nproc)
}

package() {
    DESTDIR=$pkgdir cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
