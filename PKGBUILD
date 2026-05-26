#Maintainer Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mlarchiverplugin"
pkgver="1.0.2"
pkgrel="1"
pkgdesc="MyLibrary plugin for archives creation"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mlarchiverplugin"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc' 'qt6-tools')
depends=('mylibrary')
sha256sums=('5d6dbbdafc27fa4462212281e0d754db35583cc0cb00967a5064869825fac6c6')

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
