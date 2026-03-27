# Maintainer: robertfoster

pkgname=whatsie-git
pkgver=5.0.0.r0.g3e1c02a
pkgrel=1
pkgdesc="Fast Light weight WhatsApp Client based on Qt's WebEngine, With lots of settings and packed goodies"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/keshavbhatt/whatsie"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-location' 'qt6-webchannel' 'qt6-webengine')
makedepends=('git' 'qt6-base')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cmake -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Bbuild

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" \
    cmake --install build
}
