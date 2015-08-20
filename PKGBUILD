# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=eyesight
pkgver=0.1.2
pkgrel=1
pkgdesc="EyeSight: An image viewing program"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/hawaii-desktop"
license=('GPL2')
depends=('qt5-base' 'qt5-tools')
optdepends=('qt5-svg: for svg support'
            'qt5-imageformats: for mng, tga, tiff, bmp image support')
makedepends=('cmake')
conflicts=('hawaii-eyesight' 'eyesight-git')
replaces=('hawaii-eyesight')
groups=('hawaii')
options=('debug')
source=("https://github.com/hawaii-desktop/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("037efe34e9c4c3596a452523f42c388a")

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
