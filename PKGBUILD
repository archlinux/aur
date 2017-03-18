# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=libxkbcommon-git
pkgver=0.7.1.r0.g877fe59
pkgrel=1
pkgdesc="Keymap handling library for toolkits and window systems"
url="http://xkbcommon.org/"
arch=(i686 x86_64)
license=('custom')
depends=(xkeyboard-config glibc)
makedepends=(libxcb doxygen xorg-util-macros autoconf-archive git graphviz
			 wayland wayland-protocols)
provides=('libxkbcommon' 'libxkbcommon-x11')
conflicts=('libxkbcommon' 'libxkbcommon-x11')
source=(git://github.com/xkbcommon/libxkbcommon.git)
sha1sums=('SKIP')

pkgver() {
	cd libxkbcommon
	git describe --long | sed -r 's/^xkbcommon.//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd libxkbcommon
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libxkbcommon

	./configure --prefix=/usr --disable-static
	make
}

package() {
	cd libxkbcommon

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	make DESTDIR=${pkgdir} install
}
