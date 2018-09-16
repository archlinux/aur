# Maintainer: maz-1 <ohmygod19993@gmail.com>
pkgname=('qt5-heif')
pkgbase=qt-heif-image-plugin
pkgver=0.3.2.r5.cc828d1
pkgrel=1
pkgdesc="Enables HEIF support in Qt applications"
arch=('x86_64')
url="https://github.com/jakar/qt-heif-image-plugin"
license=('LGPL')
depends=('libheif')
makedepends=('qt5-base')
source=('git+https://github.com/jakar/qt-heif-image-plugin.git' 'imagethumbnail-heif.desktop')
md5sums=('SKIP' 'f4a41542d96f07a9488d47f554bc6149')

pkgver() {
  cd "$srcdir/$pkgbase"
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

build() {
	mkdir -p build-qt5
	cd build-qt5
	cmake "$srcdir/$pkgbase" -DCMAKE_INSTALL_PREFIX="/usr" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
	make
}

package_qt5-heif() {
	depends+=('qt5-base')

	cd build-qt5
	make DESTDIR=$pkgdir install
	
	install -Dm755 "${srcdir}/imagethumbnail-heif.desktop" "${pkgdir}/usr/share/kservices5/imagethumbnail-heif.desktop"
}
