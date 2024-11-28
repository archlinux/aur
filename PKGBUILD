# Maintainer: taotieren <admin@taotieren.com>

pkgname=serial-studio
_pkgname=Serial-Studio
pkgver=3.0.6
pkgrel=2
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=('x86_64'
    'aarch64'
    'riscv64')
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
    llvm-libs
    libcap
    libcups
    libdrm
    libedit
    libelf
    libevdev
    libffi
    libglvnd
    libgudev
    libjpeg-turbo
    libice
    libp11-kit
    libpciaccess
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
    libxml2
    libxkbcommon
    libxshmfence
    lm_sensors
    keyutils
    krb5
    systemd-libs
    mesa
    mtdev
    ncurses
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
    wayland
    xcb-util
    xcb-util-image
    xcb-util-renderutil
    xz
    zlib
    zstd
)
makedepends=(
    cmake
    ninja
    $_qt-5compat
    $_qt-charts
    #     $_qt-quickcontrols2
    $_qt-quickeffectmaker
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
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${_pkgname}-${pkgver}/build install
}
