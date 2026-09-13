# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-git
pkgver=3.19.r0.gbb80e16
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
    git
    help2man
    )
provides=(lgogdownloader)
conflicts=(lgogdownloader)
source=("git+https://github.com/Sude-/lgogdownloader.git")
sha256sums=('SKIP')

pkgver() {
  cd "lgogdownloader"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DUSE_QT_GUI=OFF
  )

  cmake -B build -S "lgogdownloader" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 lgogdownloader/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
