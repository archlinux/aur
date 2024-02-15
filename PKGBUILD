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
pkgver=2.20.0
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
    'resolvconf: for resolv.conf management'
)

install=mozillavpn.install

_debian_series="mantic1"
_dl_url="https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn"
_pkgsrc="$pkgname-$pkgver"
source=("$_dl_url/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz")
sha256sums=('86d28df16f40001d24cdf5c2b913c13a09248c8ef405c0981db34c039f95f197')

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
