# Maintainer: Rihards Skuja <rhssk at posteo dot eu>
# Contributor: Vojtech Kral <vojtech_kral^hk>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

_remotename=kdeconnect-kde
_pkgname=kdeconnect
pkgname=$_pkgname-git
pkgver=24.01.80.r13.g984d5a9
pkgrel=1
pkgdesc='Adds communication between KDE and your smartphone'
arch=(x86_64)
url='https://community.kde.org/KDEConnect'
license=(GPL2)
depends=(kcmutils5 libfakekey qca-qt5 kpeoplevcard pulseaudio-qt qqc2-desktop-style5 kirigami-addons5 modemmanager-qt5 qt5-connectivity)
makedepends=(git extra-cmake-modules kdoctools5 wayland-protocols)
optdepends=('sshfs: remote filesystem browser' 'python-nautilus: Nautilus integration' 'qt5-tools: for some runcommand plugin actions')
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+https://invent.kde.org/network/$_remotename.git")
sha256sums=('SKIP')

pkgver() {
	cd $_remotename
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S $_remotename \
		-DCMAKE_INSTALL_LIBEXECDIR=lib \
		-DBUILD_TESTING=OFF \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
