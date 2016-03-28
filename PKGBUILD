# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qtaccountsservice
pkgver=0.6.0
pkgrel=1
pkgdesc="Qt-style API for AccountsService"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://hawaiios.org'
license=('LGPL2.1')
depends=('qt5-base' 'qt5-declarative')
makedepends=('extra-cmake-modules')
conflicts=('qtaccountsservice-git')
groups=('hawaii')
source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('7ad584de0b91cae301bbf52d5f41044890dbe020')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
