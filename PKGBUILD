# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=paho-mqtt-c
pkgver=1.3.14
pkgrel=2
pkgdesc="Eclipse Paho C Client Library for the MQTT Protocol"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.eclipse.org/paho/"
license=('EPL-2.0')
depends=('openssl')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eclipse/paho.mqtt.c/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7af7d906e60a696a80f1b7c2bd7d6eb164aaad908ff4c40c3332ac2006d07346')

build() {
  cd "${pkgname//-/.}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr \
    -DPAHO_WITH_SSL=TRUE -DPAHO_BUILD_SAMPLES=TRUE \
    -DCMAKE_C_STANDARD=11 \
    -S . -B build
  cmake --build build
}

check() {
  cd "${pkgname//-/.}-${pkgver}"
  # cmake --build build --target test
}

package() {
  cd "${pkgname//-/.}-${pkgver}"
  DESTDIR="$pkgdir/" cmake --install build
}
