# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=extract-artwork-git
pkgver=0.0.1.r0.g8003e63
pkgrel=1
pkgdesc='extract artwork from media files  - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/extract-artwork'
depends=('ffmpeg')
makedepends=('git' 'markdown')
conflicts=('extract-artwork')
provides=('extract-artwork')
license=('GPL')
source=('git://github.com/eworm-de/extract-artwork.git')
sha256sums=('SKIP')

pkgver() {
	cd extract-artwork/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

build() {
	cd extract-artwork/

	make
}

package() {
	cd extract-artwork/

	make DESTDIR="${pkgdir}" install
}

