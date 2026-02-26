pkgname=proton-vpn-qt-app
pkgver=1.0.0
pkgrel=1
pkgdesc="Qt6 GUI frontend for Proton VPN CLI"
arch=('x86_64')
url="https://github.com/wheat32/proton-vpn-qt-app"
license=('GPL3')
depends=(
    'qt6-base'
    'qt6-svg'
    'protonvpn-cli'
    'iproute2'
)
optdepends=(
    'networkmanager: display active server name'
    'curl: display public IP address'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
)
source=("git+https://github.com/wheat32/proton-vpn-qt-app.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cmake -S "${srcdir}/${pkgname}/src" \
          -B build \
          -G Ninja \
          -DCMAKE_BUILD_TYPE=Release

    cmake --build build
}

package() {
    install -Dm755 build/proton_vpn_qt \
        "${pkgdir}/usr/bin/proton-vpn-qt-app"
}
