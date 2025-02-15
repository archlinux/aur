# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Johan Förberg <johan@forberg.se>

pkgname=calibre-plugin-kobo-driver-git
_reponame='calibre-kobo-driver'
pkgver=3.7.2.r6.g1a222ca
pkgrel=1
pkgdesc='An extension of the existing KoboTouch driver provided with Calibre'
arch=(any)
url="https://github.com/jgoguen/${_reponame}"
license=('GPL-3.0-only')
depends=('calibre')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(python zip git)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_reponame}" describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_reponame}"

	scripts/build.sh
}

package() {
	cd "${_reponame}/release"

	install -m644 -D  -t "$pkgdir/usr/share/calibre/system-plugins" \
		'KePub Input.zip' \
		'KePub Metadata Reader.zip' \
		'KePub Metadata Writer.zip' \
		'KePub Output.zip' \
		'KoboTouchExtended.zip'
}
