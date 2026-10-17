# Maintainer: Remisa Phillips <remisa.yousefvand@gmail.com>
pkgname=sve
pkgver=0.1.0
pkgrel=1
pkgdesc='Native Qt 6 video editor with trimming, filters and FFmpeg export'
arch=('x86_64')
url='https://github.com/yousefvand/SVE'
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'qt6-multimedia' 'qt6-multimedia-ffmpeg' 'qt6-wayland' 'ffmpeg' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja')
_tag='0.1.0'
_srcdir='SVE-0.1.0'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('0c34ba8e673982e3eaf60dc7bf3a5f764425975a5009e556f0881c08e5e27583')

build() {
  cmake -S "${srcdir}/${_srcdir}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${srcdir}/${_srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
