# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=libxkbcommon-git
pkgver=0.5.0.r34.gc991a7d
pkgrel=1
pkgdesc="A library to handle keyboard descriptions."
url="http://xkbcommon.org/"
arch=(i686 x86_64)
license=('custom')
depends=('glibc' 'xkeyboard-config')
makedepends=('git' 'xorg-util-macros' 'libxcb' 'doxygen')
provides=('libxkbcommon' 'libxkbcommon-x11')
conflicts=('libxkbcommon' 'libxkbcommon-x11')
source=(git://github.com/xkbcommon/libxkbcommon.git)
sha1sums=('SKIP')

pkgver() {
	cd libxkbcommon
	git describe --long | sed -r 's/^xkbcommon.//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd libxkbcommon

	./autogen.sh --prefix=/usr --disable-static
	make
}

package() {
	cd libxkbcommon

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	make DESTDIR=${pkgdir} install
}
