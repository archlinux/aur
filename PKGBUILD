# Maintainer: robertfoster
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor:

pkgname=dhewm3
pkgver=1.5.2
pkgrel=1
pkgdesc="Doom 3 engine with native 64-bit support, SDL, and OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/dhewm/dhewm3"
license=('GPL3')
depends=('curl' 'libjpeg' 'libvorbis' 'openal' 'sdl2')
optdepends=('doom3-data')
makedepends=('cmake')
source=("${url}/archive/${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
install="${pkgname}.install"

build() {
  cd "${pkgname}-${pkgver}/neo"
  cmake -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DREPRODUCIBLE_BUILD=1 \
    -DD3XP=1 \
    -DDEDICATED=1 .
  cmake --build .
}

package() {
  cd "${pkgname}-${pkgver}/neo"
  DESTDIR="${pkgdir}" \
    cmake --install .

  install -Dm644 ../../"${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ../../"${pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../base/default.cfg \
    "${pkgdir}/usr/share/dhewm3/base/default.cfg"
  install -dm755 "${pkgdir}/usr/share/dhewm3/d3xp"
}

sha256sums=('0652d85bcc470b8535dee0fc6badd57a82a183984f7a02a3fa13937436166eb0'
  '642b56fe68ec0906abb11d3a27a7543bb23d76da50cffcec3f841fe3fa6ba069'
  '4f17fd5c3b7ada4c6d2445d760d9d83bf782398d40ad6369cd58f2c373b93b86')
