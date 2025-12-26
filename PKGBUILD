#Maintainer: Yury Bobylev <bobilev_yury@mail.ru>
pkgname="stirlitz"
pkgver="1.0"
pkgrel="1"
pkgdesc="Text and files encryption program"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/stirlitz"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc' 'doxygen')
depends=('qt6-base' 'libgcrypt')
sha256sums=('ded72470975785f1567b7e9efedfc7118213eebcb2c64e3b04b7dc019600e857')

build() {   
   local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CREATE_HTML_DOCS=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build --parallel $(nproc)
}

package() {
    DESTDIR=$pkgdir cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
