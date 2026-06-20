pkgname=proton-vpn-qt-app
pkgver=1.10.1
pkgrel=1
pkgdesc="A Qt GUI frontend for the ProtonVPN CLI"
arch=('x86_64')
url="https://github.com/wheat32/proton-vpn-qt-app"
license=('GPL3')
depends=(
    'qt6-base'
    'qt6-svg'
    'proton-vpn-cli'
)
optdepends=(
    'curl: display public IP address'
    'libnatpmp: enables port forwarding'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
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
