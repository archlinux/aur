# Maintainer CxOrg <clx.org@cloud-org.uk>
pkgname=baresip-qt-gui
pkgver=4.10.0_qt1
pkgrel=1
pkgdesc="Baresip bundled with custom native Qt applet and simple call interface for KDE Plasma6 (Wayland)"
arch=('x86_64')
url="https://github.com/CxOrg/baresip-qt"
license=('BSD-3-Clause')

depends=('qt6-base' 'layer-shell-qt' 'libre' 'openssl' 'opus' 'frameworkintegration')
makedepends=('cmake' 'git')

provides=('baresip')
conflicts=('baresip')

source=("git+https://github.com/CxOrg/baresip-qt.git#commit=848e5abb")
sha256sums=('SKIP')

build() {
  # No -DMODULES override: build all modules whose deps are available
  # (each module's CMakeLists auto-skips when its deps are missing).
  cmake -B build -S "${srcdir}/baresip-qt" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cmake --install build --prefix="${pkgdir}/usr"

  install -Dm644 "${srcdir}/baresip-qt/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
