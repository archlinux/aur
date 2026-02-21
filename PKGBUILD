# Maintainer: taotieren <admin@taotieren.com>

pkgname=serial-studio
_pkgname=Serial-Studio
pkgver=3.2.4
pkgrel=1
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=($CARCH)
url="https://github.com/Serial-Studio/Serial-Studio"
license=('GPL-3.0-only')
groups=()
_qt=qt6
depends=(
    brotli
    bzip2
    curl
    e2fsprogs
    expat
    duktape
    gcc-libs
    glib2
    glibc
    graphite
    freetype2
    icu
    libcap
    libdrm
    libevdev
    libffi
    libglvnd
    libgudev
    libice
    libpng
    libpsl
    libidn2
    libnghttp2
    libnghttp3
    libssh2
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
    mtdev
    $_qt-base
    $_qt-declarative
    $_qt-connectivity
    $_qt-graphs
    $_qt-serialport
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
    git
    ninja
    $_qt-5compat
    $_qt-charts
    $_qt-location
    $_qt-shadertools
    $_qt-quick3d
    $_qt-quickeffectmaker
    $_qt-positioning
    $_qt-svg
    $_qt-translations
    $_qt-tools
)
provides=(${_pkgname} ${pkgname})
conflicts=(${_pkgname} ${pkgname})
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('1b09f0f4e80109687881a2c159bb08d9a7e4720b33f6fac56d8c055a455f57f1')
noextract=()

build() {
    cd "$srcdir/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DPRODUCTION_OPTIMIZATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr/share/serial-studio \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -B build \
        -G Ninja \
        -Wno-dev

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install "${srcdir}"/${pkgname}/build
}

