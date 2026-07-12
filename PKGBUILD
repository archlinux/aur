# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=alacenc
pkgver=0.4.2
pkgrel=1
pkgdesc="Encode audio into the Apple Lossless Audio Codec (ALAC) format"
arch=(x86_64)
url="https://github.com/flacon/alacenc"
license=(MIT)
depends=(
    glibc
    libgcc
    )
makedepends=(
    cmake
    git
    )
source=("git+https://github.com/flacon/alacenc.git#tag=v${pkgver}")
sha256sums=('ca31c31057cfb82a2b98c4f02352e7f8711b34001adcb45600fa32374363a4da')

build() {
  local _flags=(
  )

  cmake -B build -S "alacenc" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 alacenc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
