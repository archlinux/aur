# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Better desktop integration for Riot.im (not only) for GNOME'
pkgname='revolt-git'
pkgver=r122.ecb9f8f
pkgrel=1
url='https://github.com/aperezdc/revolt'
depends=('python-gobject' 'webkit2gtk')
arch=('any')
license=('GPL3')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package () {
	cd "${pkgname}"
	make install DESTDIR="${pkgdir}"
}
