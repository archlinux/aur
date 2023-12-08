# Maintainer XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: jhorcl
# Contributor: flbzh <frederic_lebouc (a) yahoo.fr>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

pkgname=mozillavpn
pkgver=2.19.0
_debian_series=mantic1
pkgrel=2
pkgdesc="A fast, secure and easy to use VPN. Built by the makers of Firefox."
arch=('x86_64')
url="https://mozilla.org/products/vpn"
license=('MPL2')
options=('!lto')
depends=(
    'polkit'
    'libxcb'
    'libxmu'
    'libxrender'
    'libtiff'
    'libxdmcp'
    'dbus'
    'freetype2'
    'qt6-charts'
    'qt6-declarative'
    'qt6-websockets'
    'qt6-imageformats'
    'qt6-networkauth'
    'qt6-svg'
    'qt6-5compat'
    'qt6-shadertools'
    'hicolor-icon-theme'
    'wireguard-tools'
)
optdepends=(
    'resolvconf: for resolv.conf management'
    'qt6-wayland: for Wayland support'
)
makedepends=(
    'cmake'
    'qt6-tools'
    'go'
    'flex'
    'python-yaml'
    'python-lxml'
    'clang'
    'cargo'
)
install=mozillavpn.install
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages
source=("https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz" "mozillavpn.install")
sha256sums=('36754d1f0e2f3ff5b08cecf691b7e158981356dc53b55152d93925f1b4d87e03'
            'bba558c169389be05ba37d0565ca94ad43b1fdb94e137327af0e0e5229e66227')

build() {
    cd "${pkgname}-${pkgver}"
    rm -rf build && mkdir build
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
}
