#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mlinpxplugin"
pkgver="1.1"
pkgrel="1"
pkgdesc="MyLibrary plugin for .inpx collections import"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mlinpxplugin"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc')
depends=('mylibrary')
sha256sums=('33e2e06aec15b9a09ede499519409e643223f66f54fcc981e7c060b13bf744eb')

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
