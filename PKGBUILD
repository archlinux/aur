# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Johan Förberg <johan@forberg.se>

pkgname=calibre-plugin-kobo-driver-git
pkgver=3.6.7
pkgrel=2
pkgdesc='An extension of the existing KoboTouch driver provided with Calibre'
arch=(any)
url=https://github.com/jgoguen/calibre-kobo-driver/
license=('GPL-3.0-only')
depends=('calibre')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(python zip git)
source=(git+https://github.com/jgoguen/calibre-kobo-driver.git)
sha256sums=('SKIP')

pkgver() {
  git -C "$srcdir/calibre-kobo-driver" describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/calibre-kobo-driver"

	scripts/build.sh
}

package() {
	cd "$srcdir/calibre-kobo-driver"

	install -m644 -D  -t "$pkgdir/usr/share/calibre/system-plugins" \
		'KePub Input.zip' \
		'KePub Metadata Reader.zip' \
		'KePub Metadata Writer.zip' \
		'KePub Output.zip' \
		'KoboTouchExtended.zip'
}
