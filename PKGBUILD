# Maintainer:  pvg <pvg@poczta.fm>
# Contributor: Felix Rohrbach <kde@fxrh.de>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Spike29 <leguen.yannick@gmail.com>
# Contributor: Samir Faci <csgeek@archlinux.us>
# Contributor: TimothÃ©e Ravier <tim@siosm.fr>

# Based on https://aur.archlinux.org/cgit/aur.git/tree/?h=qxmpp

_realname='qxmpp'
pkgbase='qxmpp-qt5'
pkgname=('qxmpp-qt5' 'qxmpp-doc')
pkgver=1.10.3
pkgrel=1
pkgdesc='Cross-platform C++ XMPP client and server library'
arch=('i686' 'x86_64')
url='https://invent.kde.org/libraries/qxmpp'
license=('LGPL2.1')
depends=('gstreamer' 'glibc' 'gcc-libs' 'glib2')
makedepends=('cmake' 'doxygen')
source=(git+https://invent.kde.org/libraries/qxmpp#tag=v$pkgver)
sha256sums=('a6b057048d119714172cd5a7fe1a4ae2724c476b6bc85486edbe3c6866465419')

build() {
	cmake -S $_realname -B buildqt5 \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_DOCUMENTATION=1 \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DBUILD_EXAMPLES=0 \
	-DBUILD_TESTS=0 \
	-DWITH_GSTREAMER=1 \
	-DQT_VERSION_MAJOR=5

	cmake --build buildqt5
}

package_qxmpp-qt5() {
	depends+=("qt5-base" "qca-qt5")
	DESTDIR="$pkgdir" cmake --install buildqt5
	rm -rf "$pkgdir/usr/share"
}

package_qxmpp-doc(){
	pkgdesc='Cross-platform C++ XMPP client and server library (documentation)'
	arch=('any')
	DESTDIR="$pkgdir" cmake --install buildqt5
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib"
}
