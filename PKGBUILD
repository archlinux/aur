# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ok-edu-classroom-desktop-git
pkgname=ok-edu-classroom-desktop-git
pkgver=1.1.0.230628.r26.g1b1663d
pkgrel=1
pkgdesc="OkEDU-Classroom-Desktop 客户端 OkEDU Classroom 是基于“互联网+教育”理念， 解决在线上课问题而研发的互动教室，是实时、高效、功能完备的上课工具，本软件基于浏览器实时多媒体标准 WebRTC 以及即时通讯协议 XMPP 实现，具备很好的通用性、拓展性、移植性。"
arch=(x86_64
    aarch64)
url="https://gitee.com/chuanshantech/ok-edu-classroom-desktop"
license=('GPL-2.0' 'MulanPubL-2.0')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
        python)
makedepends=(
    cmake
    ninja
#     gbm
    gcc
    git
    gtk3
    libdrm
    libinput
    libxi
    libxkbfile
    krb5
    mtdev
    openssl
    systemd
    perl
    pkgconf

# Qt xcb
    qt5-tools
    freetype2
    fontconfig
    libx11
    libxcb
    libxcrypt
    libxext
    libxfixes
    libxrender

# Qt Multimedia
    alsa-lib
    gstreamer

# sqlite sqlcipher
    sqlite
    sqlcipher

# vpx qrencode sodium
    libvpx
    libjpeg-turbo
    libtiff
    libpng
    ffmpeg
    qrencode
    libsodium

# webrtc gloox
    webrtc-audio-processing
    gloox
            )
checkdepends=()
optdepends=()
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_CONFIGURATION_TYPES=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
