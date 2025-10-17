#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mlfbdplugin"
pkgver="1.0"
pkgrel="1"
pkgdesc="MyLibrary plugin for fbd format files creation"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mlfbdplugin"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc')
depends=('mylibrary' 'imagemagick')
sha256sums=('fdcc2bd69d9ceb0ae59155c4866a3787a009a4ac5b2bbe3a1df82cba105a5535')

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
