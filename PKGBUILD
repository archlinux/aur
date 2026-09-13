# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: C. Dominik Bódi <dominikdotbodiatgmxdotde>
# Contributor: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader
pkgver=3.19
pkgrel=1
pkgdesc="Open source downloader for GOG.com games, uses the GOG.com API"
url="https://github.com/Sude-/lgogdownloader"
arch=(x86_64 i686 pentium4)
license=(WTFPL)
depends=(
    boost-libs libboost_filesystem.so
    curl
    glibc
    jsoncpp
    libgcc
    libstdc++
    rhash
    tidy
    tinyxml2
    )
makedepends=(
    boost
    cmake
    help2man
    )
source=("https://github.com/Sude-/lgogdownloader/releases/download/v${pkgver}/lgogdownloader-${pkgver}.tar.gz")
sha256sums=('0fd3622f1cee4627048aafbbebd17dc38fd3ddb220c979e4a118eeab2cc665d4')

build() {
  local _flags=(
    -DUSE_QT_GUI=OFF
  )

  cmake -B build -S "lgogdownloader-${pkgver}" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "lgogdownloader-${pkgver}"/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
