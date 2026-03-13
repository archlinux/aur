pkgname=proton-vpn-qt-app
pkgver=1.3.1
pkgrel=1
pkgdesc="A Qt GUI frontend for the ProtonVPN CLI"
arch=('x86_64')
url="https://github.com/wheat32/proton-vpn-qt-app"
license=('GPL3')
depends=(
    'qt6-base'
    'qt6-svg'
    'proton-vpn-cli'
    'iproute2'
)
optdepends=(
    'networkmanager: display active server name'
    'curl: display public IP address'
    'systemd: have the app auto-start'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
)
source=(
  "git+https://github.com/wheat32/proton-vpn-qt-app.git#tag=v${pkgver}"
  "proton-vpn-qt-app.desktop"
  "proton-vpn-sign.svg"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

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

    install -Dm644 proton-vpn-qt-app.desktop \
        "${pkgdir}/usr/share/applications/proton-vpn-qt-app.desktop"

    install -Dm644 proton-vpn-sign.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/proton-vpn-qt-app.svg"
}
