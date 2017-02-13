# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=knotifications
pkgname=${_pkgname}-light
pkgver=5.31.0
pkgrel=1
pkgdesc="Abstraction for system notifications, light version without Text-to-Speech"
arch=('i686' 'x86_64')
url="https://community.kde.org/Frameworks"
license=('LGPL')
depends=('phonon-qt5' 'libdbusmenu-qt5' 'kwindowsystem' 'kconfig' 'kcodecs' 'kcoreaddons')
makedepends=('extra-cmake-modules' 'qt5-tools' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=('kf5')
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('9e72d1240228878142d7c8075ba067041188d9ffc956f134fb95ecf9fe6ce55b'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${_pkgname}-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DKDE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF \
        -DQt5TextToSpeech_FOUND=OFF
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
