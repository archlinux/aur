# Maintainer: Kimiblock Moe
# Contributor: Integral
# Contributor: ZhangHua

pkgname=qcm
pkgver=1.1.2
pkgrel=1
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
	'ffmpeg'
	"fmt")
makedepends=(
	'git'
	'cmake'
	'extra-cmake-modules'
	'ninja')
provides=("qcm")
source=("git+https://github.com/hypengw/Qcm.git#tag=v${pkgver}")
sha256sums=('6d753b055606830d90063c30b684ebd63722f590e62de196b3a31e067e785a02')
conflicts=("qcm")

function prepare() {
	cd "${srcdir}/Qcm"
	git submodule update --init --recursive
}

function build(){
	cd "${srcdir}/Qcm"
	cmake -S . -B build -GNinja -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

function package(){
	cd "${srcdir}/Qcm"
	DESTDIR="${pkgdir}" cmake --install build
	mv "${pkgdir}/usr/local"/* "${pkgdir}/usr"
# 	mkdir -p "${pkgdir}/usr/share/Qcm/"
# 	cp -r "${srcdir}/Qcm/build/qml_modules" "${pkgdir}/usr/share/Qcm/"
# 	sed -i 's|Exec=Qcm|Exec=env QML_IMPORT_PATH=/usr/share/Qcm/qml_modules Qcm|g' \
# 		"${pkgdir}/usr/share/applications"/*.desktop
}
