# $Id: PKGBUILD 151884 2015-12-10 04:07:37Z foutrelis $
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Kyle <kyle@gmx.ca>

pkgname=qt-at-spi
pkgver=0.3.1
pkgrel=4
pkgdesc="A Qt plugin that bridges the QAccessible API’s to the AT-SPI 2 protocol, giving blind and visually impaired users access to qt applications."
arch=(i686 x86_64)
url="http://projects.kde.org/qtatspi"
license=('LGPL')
depends=('at-spi2-core' 'qt4>=4.8')
options=('!libtool')
source=("$pkgname-$pkgver.tar.gz::http://quickgit.kde.org/?p=qtatspi.git&a=snapshot&h=f0fb5fd1&fmt=tgz"
        qt-accessibility.sh)
md5sums=('622b5f48a0c7e88d6378055845667be5'
         'f0c8551ed54f5d4e5daf7ddac9189aaa')

build() {
	cd qtatspi
	qmake-qt4
	make
}

check() {
	cd qtatspi
	make -k check
}

package() {
	cd qtatspi
	make INSTALL_ROOT="$pkgdir" install
	install -D -m755 "$srcdir/qt-accessibility.sh" "$pkgdir/etc/profile.d/qt-accessibility.sh"
}
