# Maintainer: monosans <hsyqixco at protonmail dot com>

pkgname=st-monosans-git
pkgver=0.8.4.r1141.966386b
pkgrel=5
pkgdesc='Simple (suckless) terminal with scrollback, ligatures and One Dark color scheme'
url=https://github.com/monosans/st
arch=(i686 x86_64)
license=(MIT)
depends=(libxft harfbuzz ttf-jetbrains-mono)
makedepends=(git libxext ncurses)
source=(git://github.com/monosans/st
        config.mk)
sha256sums=('SKIP'
            '328eab38522960e2155f3011a2839124f6da74a8dc3515378a9778824167a436')
provides=(st)
conflicts=(st)

pkgver() {
	cd st
	echo "$(awk '/^VERSION =/ {print $3}' config.mk)".r"$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

prepare() {
	cp config.mk st/
	cd st
	sed -i '/tic /d' Makefile
}

build() {
	cd st
	make
}

package() {
	cd st
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
