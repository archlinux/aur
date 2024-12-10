# Maintainer: Johan Förberg <johan@forberg.se>

pkgname=calibre-plugin-kobo-driver
pkgver=3.7.2
pkgrel=1
pkgdesc='An extension of the existing KoboTouch driver provided with Calibre'
arch=(any)
url=https://github.com/jgoguen/calibre-kobo-driver/
license=(GPL3)
depends=('calibre')
makedepends=(python zip)
source=(https://github.com/jgoguen/calibre-kobo-driver/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('3039d101835c17d1152af4b7a8989f4552aa39f7ecb7d619e9f7083d7281d828')

build() {
	cd "$srcdir/calibre-kobo-driver-$pkgver"

	# Help build.sh find the root directory by faking a git repo
	mkdir -p .git

	scripts/build.sh
}

package() {
	cd "$srcdir/calibre-kobo-driver-$pkgver"

	install -m644 -D  -t "$pkgdir/usr/share/calibre/system-plugins" \
		'KePub Input.zip' \
		'KePub Metadata Reader.zip' \
		'KePub Metadata Writer.zip' \
		'KePub Output.zip' \
		'KoboTouchExtended.zip'
}
