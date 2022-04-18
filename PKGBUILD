# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=mediasmartserverd-git
pkgver=0.5.6.r6.bc30e0b
pkgrel=1
pkgdesc="Daemon to control LEDs on HP MediaSmart and similar servers"
arch=(any)
url="https://github.com/merelin/mediasmartserverd"
license=('zlib')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 mediasmartserverd "$pkgdir/usr/bin/mediasmartserverd"
	install -Dm644 lib/systemd/system/mediasmartserver.service "$pkgdir/usr/lib/systemd/system/mediasmartserver.service"
}
