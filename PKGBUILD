#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mlarchiverplugin"
pkgver="1.0"
pkgrel="1"
pkgdesc="MyLibrary plugin for archives creation"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mlarchiverplugin"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc')
depends=('mylibrary')
sha256sums=('fdfae093f61a73e909c5895f2954a5fc417f4649d09dcce25274d2864bec1142')

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
