#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mlfbdplugin"
pkgver="1.1"
pkgrel="1"
pkgdesc="MyLibrary plugin for fbd format files creation"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mlfbdplugin"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc')
depends=('mylibrary' 'imagemagick')
sha256sums=('17b62bffd8fa2765b48796d25874df4af04868b5510d39524ed460782c56903d')

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
