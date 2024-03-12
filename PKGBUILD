# Maintainer: erdii <me at erdii dot engineering>
pkgname=ice9-bluetooth-sniffer
pkgver=23.06.0
pkgrel=1
pkgdesc=" Wireshark-compatible all-channel BLE sniffer for bladeRF, with wideband Bluetooth sniffing for HackRF and USRP"
arch=("any")
provides=()
conflicts=()
url="https://github.com/mikeryan/ice9-bluetooth-sniffer"
license=("GPLv2")
depends=("liquid-dsp" "hackrf" "bladerf" "libuhd" "fftw")
makedepends=("cmake")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1bb5ffa6494513406c5c482bb0a427c5e1012b103602f325d24827abbc82d6c1')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
