#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mlfbdplugin"
pkgver="2.0.1"
pkgrel="1"
pkgdesc="MyLibrary plugin for fbd format files creation"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mlfbdplugin"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc' 'qt6-tools')
depends=('mylibrary')
sha256sums=('20ec0494d484bea693c83e31f60ef50682e17e5a8a604a0125c20839ca2503f7')

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
