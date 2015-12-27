# Maintainer: weltensturm <weltensturm at gmail dot com>

_name=flatman
pkgname=${_name}-git
pkgver=v1.0.2.r0.gf670c77
pkgrel=1
pkgdesc="Tiling window manager written in D"
arch=('i686' 'x86_64')
url="https://github.com/weltensturm/flatman"
license=('MIT')

conflicts=('flatman')
depends=('libxft' 'libxrender')
makedepends=('dub' 'dmd')

source=("$pkgname"::'git+https://github.com/weltensturm/flatman')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	dub build --build=release
	cd compositor
	dub build --build=release
	cd ../dock
	dub build --build=release
	cd ../menu
	dub build --build=release
	cd ../volume-icon
	dub build --build=release
}

package() {
	cd "$pkgname"
	install -D -m655 flatman ${pkgdir}/usr/bin/flatman
	install -D -m655 compositor/flatman-compositor ${pkgdir}/usr/bin/flatman-compositor
	install -D -m655 dock/flatman-dock ${pkgdir}/usr/bin/flatman-dock
	install -D -m655 menu/flatman-menu ${pkgdir}/usr/bin/flatman-menu
	install -D -m655 volume-icon/flatman-volume-icon ${pkgdir}/usr/bin/flatman-volume-icon
	install -D -m644 res/config.ws ${pkgdir}/etc/flatman/config.ws
	install -D -m644 res/flatman.desktop ${pkgdir}/usr/share/xsessions/flatman.desktop
}

