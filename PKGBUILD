# Maintainer: Kimiblock
pkgname=qcm
pkgver=1.0.1
pkgrel=1
_tag=36854ca244bdccccaa3bfe9c6bb16b79dae4418a
pkgdesc="Qt client for netease cloud music "
arch=('x86_64')
url="https://github.com/hypengw/Qcm"
license=('GPL2')
depends=(
    'qt6-base'
    'qt6-shadertools'
    'hicolor-icon-theme'
    'curl'
    'openssl'
    'qt6-tools'
    'qt6-multimedia'
    'qt6-declarative'
    "qt6-5compat"
    'gcc-libs'
    'glibc'
    'dbus'
    'libnghttp2'
    'libidn2'
    'krb5'
    'zstd'
    'zlib'
    'qt6-wayland'
    'libx11'
    'libxkbcommon'
    'libpng'
    'freetype2'
    'icu'
    'pcre2'
    'gnutls'
    'graphite'
    'lz4'
    'libgpg-error'
    'ffmpeg'
    'glibmm')
makedepends=(
    'git'
    'cmake'
    'extra-cmake-modules'
    'ninja')
provides=("qcm")
conficts=(qcm-git)
source=("git+https://github.com/hypengw/Qcm.git#tag=${_tag}")
sha256sums=('SKIP')

function pkgver() {
	echo 1.0.1
}

function build() {
    if [ -d "${srcdir}"/Qcm/build ]; then
        _info "Deleting ${srcdir}/Qcm/build"
        rm -r "${srcdir}"/Qcm/build
    fi
    cd Qcm
    git submodule update --init
    mkdir build
    cd build
    cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release
    ninja
}

function package() {
    install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.hypengw.Qcm.svg"
    install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.desktop" "${pkgdir}/usr/share/applications/Qcm.desktop"
    install -Dm755 "${srcdir}/Qcm/build/app/Qcm" "${pkgdir}/usr/bin/Qcm"
}

