# Maintainer XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: jhorcl
# Contributor: flbzh <frederic_lebouc (a) yahoo.fr>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

## useful urls:
# https://vpn.mozilla.org
# https://github.com/mozilla-mobile/mozilla-vpn-client
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages

pkgname=mozillavpn
pkgver=2.22.0
pkgrel=1
pkgdesc="Fast, secure, and easy to use VPN from the makers of Firefox"
arch=('x86_64')
url="https://vpn.mozilla.org"
license=('MPL2')
options=('!lto')
depends=(
    'dbus'
    'freetype2'
    'hicolor-icon-theme'
    'libtiff'
    'libxcb'
    'libxdmcp'
    'libxmu'
    'libxrender'
    'polkit'
    'qt6-5compat'
    'qt6-charts'
    'qt6-declarative'
    'qt6-imageformats'
    'qt6-networkauth'
    'qt6-shadertools'
    'qt6-svg'
    'qt6-websockets'
    'wireguard-tools'
)
makedepends=(
    'cargo'
    'clang'
    'cmake'
    'flex'
    'go'
    'python-lxml'
    'python-yaml'
    'qt6-tools'
)
optdepends=(
    'qt6-wayland: for Wayland support'
)

install=mozillavpn.install

_debian_series="noble1"
_dl_url="https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn"
_pkgsrc="$pkgname-$pkgver"
source=("$_dl_url/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz")
sha256sums=('e8c46a97ebfd01c0d59a96a3c33232d4ae2529d02e49fa7095bc47a58c3d9d68')

build() {
    local _cmake_options=(
        -B build
        -S "$_pkgsrc"
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX='/usr'
        -Wno-dev
    )

    cmake "${_cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
