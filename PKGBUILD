# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=alacenc-git
pkgver=0.3.0.2.g260574f
pkgrel=1
pkgdesc="Encode audio into the Apple Lossless Audio Codec (ALAC) format. (Git Version)"
arch=('x86_64')
url='https://github.com/flacon/alacenc'
license=('MIT')
depends=('gcc-libs')
makedepends=('git'
             'cmake'
             )
conflicts=('alacenc')
provides=('alacenc')
source=('git+https://github.com/flacon/alacenc.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd alacenc
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -S alacenc -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 alacenc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
