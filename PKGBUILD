pkgname=easyaudiosync
pkgver=1.1.2
pkgrel=1
epoch=0
pkgdesc="Audio library syncing and conversion utility"
arch=(x86_64)
url="https://github.com/complexlogic/EasyAudioSync"
license=(Unlicense)
depends=(qt6-base libavcodec.so libavformat.so libswresample.so libavfilter.so libavutil.so taglib spdlog fmt)
makedepends=(cmake qt6-tools)
provides=(easyaudiosync)
source=(
  https://github.com/complexlogic/EasyAudioSync/releases/download/v${pkgver}/easyaudiosync-${pkgver}-source.tar.xz
)
sha256sums=(
  134a53d8a46c09f9f4744bcbe6f15cf07a01fd4081091fe3bf8a280a871401f5
)

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
        -DQT_VERSION=6
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
