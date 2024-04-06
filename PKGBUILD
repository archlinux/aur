# Maintainer: Kimiblock
# Contributor: Integral

pkgname=qcm
pkgver=1.0.2
pkgrel=2
pkgdesc="Qt client for netease cloud music"
arch=('x86_64')
url="https://github.com/hypengw/Qcm"
license=('GPL-2.0-or-later')
depends=(
    'qt6-base'
    'qt6-shadertools'
    'hicolor-icon-theme'
    'curl'
    'openssl'
    'qt6-tools'
    'qt6-declarative'
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
    'ffmpeg')
makedepends=(
    'git'
    'cmake'
    'extra-cmake-modules'
    'ninja')
provides=("qcm")
conflicts=()
source=("git+https://github.com/hypengw/Qcm.git#tag=v${pkgver}")
sha256sums=('SKIP')

function prepare() {
	cd Qcm
	git submodule update --init
}

function build() {
    if [ -d "${srcdir}"/Qcm/build ]; then
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
	local APP_ID=io.github.hypengw.Qcm
	install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${APP_ID}.svg"
	install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.desktop" "${pkgdir}/usr/share/applications/${APP_ID}.desktop"
	install -Dm755 "${srcdir}/Qcm/build/app/Qcm" "${pkgdir}/usr/bin/Qcm"
}

