# Maintainer: Ruslan Osmanov <608192+rosmanov@users.noreply.github.com>

pkgname=beectl
pkgver=1.5.1
pkgrel=1
pkgdesc="Native Messaging Host for the Bee Browser Extension <https://github.com/rosmanov/chrome-bee>"
arch=('x86_64' 'aarch64' 'i686' 'pentium4' 'armv7h' 'ppc64le')
url="https://github.com/rosmanov/bee-host"
license=('MIT')
depends=('libuv' 'cjson')
makedepends=('cmake' 'pkgconf')
source=()
sha256sums=()

build() {
  cmake -B build -S "$startdir/.." \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_DEPS=ON \
    -DBEECTL_BIN_DIR=bin \
    -DBEECTL_CHROME_MANIFEST_DIR=/etc/opt/chrome/native-messaging-hosts \
    -DBEECTL_CHROMIUM_MANIFEST_DIR=/etc/chromium/native-messaging-hosts \
    -DBEECTL_FIREFOX_MANIFEST_DIR=/usr/lib/mozilla/native-messaging-hosts \
    -DBEECTL_FIREFOX_MANIFEST_DIR_ALT=""
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
