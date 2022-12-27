# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-accountsservice
pkgver=1.3.0
pkgrel=1
pkgdesc="Qt-style wrapper for Accounts Service"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('LGPL3')
depends=('qt5-declarative')
makedepends=('liri-cmake-shared')
groups=('liri')
source=("https://github.com/lirios/qtaccountsservice/releases/download/v${pkgver}/qtaccountsservice-${pkgver}.tar.xz")
sha256sums=('358a31f1b7db2f726a5146115843677254da3ede2c91db8788eac1cf6a5a88b5')

prepare() {
        mkdir -p build
}

build() {
	cd build
	cmake ../${_gitname} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING:BOOL=OFF \
		-DINSTALL_SYSCONFDIR=/etc \
		-DINSTALL_LIBDIR=/usr/lib \
		-DINSTALL_LIBEXECDIR=/usr/lib \
		-DINSTALL_QMLDIR=/usr/lib/qt/qml \
		-DINSTALL_PLUGINSDIR=/usr/lib/qt/plugins
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
