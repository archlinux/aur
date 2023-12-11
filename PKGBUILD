# Maintainer XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: xiota / aur.chaotic.cx
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: jhorcl
# Contributor: flbzh <frederic_lebouc (a) yahoo.fr>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

pkgname=mozillavpn
pkgver=2.19.0
_debian_series=mantic1
pkgrel=4
pkgdesc="A fast, secure and easy to use VPN. Built by the makers of Firefox"
arch=('x86_64')
url="https://vpn.mozilla.org"
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
            'fd50a85e735f755857a02100a9a567bdb9af439d442c4fe72c6e76c108d7b303')

build() {
    cd "${pkgname}-${pkgver}"
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
}
