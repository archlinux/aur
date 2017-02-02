# $Id: PKGBUILD 151884 2015-12-10 04:07:37Z foutrelis $
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Kyle <kyle@gmx.ca>
# Contributor: Peter Vágner <pvdeejay@gmail.com>

pkgname=qt-at-spi-git
pkgver=0.4.0.r2.g15ab906
pkgrel=1
pkgdesc="A Qt plugin that bridges the QAccessible API’s to the AT-SPI 2 protocol, giving blind and visually impaired users access to qt applications."
arch=(i686 x86_64)
url="http://projects.kde.org/qtatspi"
license=('LGPL')
depends=('at-spi2-core' 'qt4>=4.8' 'kdelibs')
makedepends=('git' 'cmake' 'automoc4')
provides=('qt-at-spi')
conflicts=('qt-at-spi')
options=('!libtool')
source=("git://anongit.kde.org/qtatspi.git"
        qt-accessibility.sh)
md5sums=('SKIP'
         'f0c8551ed54f5d4e5daf7ddac9189aaa')

pkgver() {
	cd qtatspi
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd qtatspi
	mkdir -p build
	cd build
	cmake -D CMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd qtatspi/build
	make DESTDIR="$pkgdir" install
	install -D -m755 "$srcdir/qt-accessibility.sh" "$pkgdir/etc/profile.d/qt-accessibility.sh"
}
