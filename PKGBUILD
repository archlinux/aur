# Maintainer: Johan Förberg <johan@forberg.se>

pkgname=calibre-plugin-kobo-driver
pkgver=3.6.11
pkgrel=1
pkgdesc='An extension of the existing KoboTouch driver provided with Calibre'
arch=(any)
url=https://github.com/jgoguen/calibre-kobo-driver/
license=(GPL3)
depends=('calibre')
makedepends=(python zip)
source=(https://github.com/jgoguen/calibre-kobo-driver/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6af537e4ee313cec0ef07f78dd0df3dde2557a83e49c716a8c8008bae6245c5d')

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
