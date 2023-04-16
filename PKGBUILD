# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=timeswitch-git
pkgver=0.1.1.r1.gce836d6
pkgrel=2
pkgdesc='Power off, reboot, suspend or send a notification on timer.'
arch=(any)
url=https://github.com/fsobolev/${pkgname%-git}
license=(MIT)
depends=(gsound gtk4 libadwaita python python-gobject)
makedepends=(git meson)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url.git)
b2sums=(SKIP)

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson ${pkgname%-git} build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 ${pkgname%-git}/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
