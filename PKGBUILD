# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=toolblex
pkgver=0.17
pkgrel=2
pkgdesc="A Bluetooth Low Energy device scanner and analyzer"
url="https://github.com/emericg/toolBLEx"
arch=("x86_64" "i686")
license=("GPL3")
makedepends=("qt6-tools" "cmake")
depends=("qt6-base" "qt6-declarative" "qt6-svg" "qt6-connectivity" "qt6-graphs")

optdepends=("bluez-utils: extra bluetooth infos")
optdepends=("ubertooth: 2.4 GHz spectrum analyzer with Ubertooth One")
optdepends=("rtl-sdr: RtlSdr toolset")
optdepends=("soapyrtlsdr-git: Sub 2.2 GHz spectrum analyzer with RtlSdr compatible hardware (soapypower backend)")
optdepends=("rtl_power_fftw-git: Sub 2.2 GHz spectrum analyzer with RtlSdr compatible hardware (rtl_power_fftw backend)")

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/emericg/toolBLEx/archive/v${pkgver}.tar.gz")
sha256sums=('6cde3277bb9001e82531d61a55d6e5073d58d221e97824e7297e4eca4e2451de')

build() {
  cd "toolBLEx-${pkgver}"
  cmake -B build/ -DCMAKE_BUILD_TYPE=Release
  cmake --build build/ --config Release
}

package() {
  cd "toolBLEx-${pkgver}"
  DESTDIR="$pkgdir" cmake --install build --prefix /usr/
  #sudo setcap cap_net_admin,cap_net_raw=${pkgdir}/usr/bin/toolBLEx
}
