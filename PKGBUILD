# Maintainer: kharovtobi <tugboat_khatov at outlook dot com>

_pkgname=karton-virt
pkgname=$_pkgname-git
pkgver=r36.976b74b
pkgrel=1
pkgdesc="A libvirt-based Virtual Machine Manager for KDE."
arch=('x86_64')
url="https://invent.kde.org/sitter/karton"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'libvirt' 'kirigami' 'kdeclarative' 'kcoreaddons' 'kcmutils' 'qqc2-desktop-style' 'vulkan-headers' 'vulkan-tools' 'virt-viewer' 'libosinfo' 'qemu-desktop')
makedepends=('git' 'extra-cmake-modules')
# karton pkg went first on AUR, why not add virt next to it?
provides=('karton-virt' 'karton')
conflicts=('karton')
source=("git+https://invent.kde.org/sitter/karton.git")
sha256sums=('SKIP')

pkgver() {
	cd karton
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
}

build() {
	cd karton
	cmake -B build -S . -Wno-dev \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd karton
	DESTDIR="$pkgdir/" cmake --install build
}
