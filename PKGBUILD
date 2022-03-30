# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=paho-mqtt-c
pkgver=1.3.10
pkgrel=1
pkgdesc="Eclipse Paho C Client Library for the MQTT Protocol"
arch=('x86_64')
url="https://www.eclipse.org/paho/"
license=('custom:EPL2' 'custom:EDL')
depends=('openssl')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eclipse/paho.mqtt.c/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c70db96e66adacae411d5d875fbb08bca6ff9945de3d215b3af93cbd22792db5')

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
