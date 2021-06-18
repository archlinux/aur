# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=paho-mqtt-c
pkgver=1.3.9
pkgrel=1
pkgdesc="Eclipse Paho C Client Library for the MQTT Protocol"
arch=('x86_64')
url="https://www.eclipse.org/paho/"
license=('custom:EPL2' 'custom:EDL')
depends=('openssl')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eclipse/paho.mqtt.c/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('386c9b5fa1cf6d0d516db12d57fd8f6a410dd0fdc5e9a2da870aae437a2535ed')

build() {
  cd "${pkgname//-/.}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr \
    -DPAHO_WITH_SSL=TRUE -DPAHO_BUILD_SAMPLES=TRUE \
    -S . -B build
  cmake --build build
}

check() {
  cd "${pkgname//-/.}-${pkgver}"
  # cmake --build build --target test
}

package() {
  cd "${pkgname//-/.}-${pkgver}"
  cmake --build build --target install -- DESTDIR="$pkgdir/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 edl-v10 "${pkgdir}/usr/share/licenses/${pkgname}/edl-v10"
  install -Dm644 epl-v20 "${pkgdir}/usr/share/licenses/${pkgname}/epl-v20"
}
