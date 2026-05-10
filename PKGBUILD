#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mlarchiverplugin"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="MyLibrary plugin for archives creation"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mlarchiverplugin"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc' 'qt6-tools')
depends=('mylibrary')
sha256sums=('78b336fbf504ab4164a0c84bdaca6c08fc6b55b69b5b1cdda8e35b637fb67e51')

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
