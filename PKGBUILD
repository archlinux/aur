# Maintainer: Remisa Phillips <remisa.yousefvand@gmail.com>

pkgname=imagetransient
pkgver=0.2.0
pkgrel=1
pkgdesc='Compact Qt 6 app for creating MP4 transition videos from two still images'
arch=('x86_64')
url='https://github.com/yousefvand/ImageTransient'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'ffmpeg')
makedepends=('cmake' 'ninja' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yousefvand/ImageTransient/archive/refs/tags/v0.2.0.tar.gz")
sha256sums=('c03fa44e03083394f1c34ace5973ac104e3d7d7d3341946c1a6654b3d62e7f77')

_find_srcdir() {
  find "${srcdir}" -mindepth 1 -maxdepth 1 -type d -name 'ImageTransient-*' -print -quit
}

build() {
  cd "$(_find_srcdir)"
  cmake -S . -B build -G Ninja     -DCMAKE_BUILD_TYPE=Release     -DCMAKE_INSTALL_PREFIX=/usr     -DCMAKE_SKIP_RPATH=ON
  cmake --build build --parallel "$(nproc)"
}

package() {
  cd "$(_find_srcdir)"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
