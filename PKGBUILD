# Maintainer: Reverier <reverier.xu@woooo.tech>

_pkgname='wsrx'
pkgname="wsrx-git"
pkgver=0.2.0.r9.gc6e2eb4
pkgrel=2
pkgdesc="Controlled TCP-over-WebSocket forwarding tunnel."
arch=('x86_64')
url='https://github.com/XDSEC/WebSocketReflectorX'
license=('MIT')
makedepends=('git' 'rust' 'clang' 'ninja' 'bash' 'sed' 'cmake' 'extra-cmake-modules')
depends=('qt6-base' 'qt6-svg' 'qt6-translations' 'qt6-wayland' 'qt6-declarative' 'qt6-remoteobjects')
provides=("${_pkgname}" "${_pkgname}-desktop")
source=("git+https://github.com/XDSEC/WebSocketReflectorX.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
    cd "${srcdir}/WebSocketReflectorX"
    git describe --long --tags | sed 's|^upstream/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/WebSocketReflectorX"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -G Ninja
  cmake --build build --config Release --target all
}

package() {
  cd "${srcdir}/WebSocketReflectorX"
  install -D ./build/bin/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -D ./build/bin/${_pkgname}-desktop "${pkgdir}/usr/bin/${_pkgname}-desktop"
  install -Dm644 "./freedesktop/tech.woooo.${_pkgname}.desktop" "$pkgdir"/usr/share/applications/tech.woooo.${_pkgname}.desktop
  install -Dm644 "./freedesktop/tech.woooo.${_pkgname}.svg" "$pkgdir"/usr/share/icons/hicolor/scalable/apps/tech.woooo.${_pkgname}.svg
}
