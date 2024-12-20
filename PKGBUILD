# Maintainer: taotieren <admin@taotieren.com>

pkgname=serial-studio
_pkgname=Serial-Studio
pkgver=3.0.6
pkgrel=5
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=($CARCH)
url="https://github.com/Serial-Studio/Serial-Studio"
license=('MIT')
groups=()
_qt=qt6
depends=(
    avahi
    brotli
    bzip2
    curl
    e2fsprogs
    expat
    dbus
    duktape
    gcc-libs
    glib2
    glibc
    gmp
    graphite
    gnutls
    harfbuzz
    freetype2
    icu
    libcap
    libcups
    libdrm
    libevdev
    libffi
    libglvnd
    libgudev
    libjpeg-turbo
    libice
    libp11-kit
    libpng
    libpsl
    libidn2
    libnghttp2
    libnghttp3
    libssh2
    libtasn1
    libunistring
    libwacom
    libx11
    libxau
    libxcb
    libxdmcp
    libxkbcommon
    keyutils
    krb5
    systemd-libs
    mesa
    mtdev
    nettle
    $_qt-base
    $_qt-declarative
    $_qt-connectivity
    $_qt-location
    $_qt-graphs
    $_qt-quick3d
    $_qt-positioning
    $_qt-serialport
    $_qt-svg
    openssl
    pcre2
    util-linux-libs
    xcb-util
    xcb-util-image
    xcb-util-renderutil
    zlib
    zstd
)
makedepends=(
    cmake
    $_qt-5compat
    $_qt-charts
    $_qt-shadertools
    #     $_qt-quickcontrols2
    $_qt-quickeffectmaker
    $_qt-translations
    $_qt-tools
)
provides=(${_pkgname} ${pkgname})
conflicts=(${_pkgname} ${pkgname})
replaces=()
backup=()
options=()
install=
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3141605fae37869f4375349bbfa0242ae66b3914ead31ea11866ab3fac2f20e4')
noextract=()

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DPRODUCTION_OPTIMIZATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr/share/serial-studio \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -B build \
        -Wno-dev

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install "${srcdir}"/${_pkgname}-${pkgver}/build
}
