# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=alacenc
pkgver=0.3.0
pkgrel=2
pkgdesc="Encode audio into the Apple Lossless Audio Codec (ALAC) format"
arch=(x86_64)
url="https://github.com/flacon/alacenc"
license=(MIT)
depends=(gcc-libs)
makedepends=(git cmake)
source=("git+https://github.com/flacon/alacenc.git#tag=v${pkgver}"
        "alacenc-gcc13-fix.patch::https://github.com/flacon/alacenc/pull/3/commits/84b6e5c7aee44a052bddffca9e7d486eb97c50f7.patch")
sha256sums=('SKIP'
            'a959af32736882778d4017b378a1267163a0d0c86729196c99bdaa67cacfc215')

prepare() {
  cd alacenc
  patch -Np1 -i ../alacenc-gcc13-fix.patch
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
