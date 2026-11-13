# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgname=dux-qt-base
pkgver=0.4.4
pkgrel=1
pkgdesc='Quickshell QML runtime as a shared library with a C entry point'
arch=(x86_64 aarch64)
url="https://github.com/duxlabs-dev/$pkgname"
license=(LGPL-3.0-only)
depends=(gcc-libs
         glib2
         libdrm
         libglvnd
         libpipewire
         libxcb
         libxkbcommon
         mesa
         pam
         polkit
         qt6-base
         qt6-declarative
         qt6-wayland
         wayland)
makedepends=(cli11
             cmake
             ninja
             pkgconf
             qt6-shadertools
             spirv-tools
             vulkan-headers
             wayland-protocols)
optdepends=('qt6-svg: svg images and icons')
provides=(libdux-qt-base.so)
conflicts=("$pkgname-git" "$pkgname-bin")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e29a0960f15e494def64db79cdb1e8a38aa414c86a219836369db5a02e184b21')

build() {
	cmake -GNinja -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DDISTRIBUTOR="AUR ($pkgname)" \
		-DGIT_REVISION="v$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE" "$pkgname-$pkgver/LICENSE-GPL"
}
