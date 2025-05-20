# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=alacenc
pkgver=0.4.1
pkgrel=2
pkgdesc="Encode audio into the Apple Lossless Audio Codec (ALAC) format"
arch=(x86_64)
url="https://github.com/flacon/alacenc"
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(git cmake)
source=("git+https://github.com/flacon/alacenc.git#tag=v${pkgver}")
sha256sums=('8ed8c66884b305b466e8454a7c809330e827340529ddc1e0631a0e172a1f8d0f')

build() {
  cmake -S alacenc -B build -Wno-dev \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 alacenc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
