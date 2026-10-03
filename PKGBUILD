pkgname=proton-vpn-qt-app
pkgver=1.11.0
pkgrel=1
pkgdesc="A Qt GUI frontend for the ProtonVPN CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/wheat32/proton-vpn-qt-app"
license=('GPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-svg'
    'proton-vpn-cli'
)
optdepends=(
    'libnatpmp: enables port forwarding'
    'xdg-utils: open the releases page from the update prompt'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
    'qt6-tools'
)
source=(
  "git+https://github.com/wheat32/proton-vpn-qt-app.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
    cmake -S "${srcdir}/${pkgname}/src" \
          -B build \
          -G Ninja \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    # Compatibility symlink for any existing scripts/launchers
    ln -s proton_vpn_qt "${pkgdir}/usr/bin/proton-vpn-qt-app"
}
