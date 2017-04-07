# Maintainer: Teteros <teteros -at- openmailbox -dot- org>

_pkgname=protrekkr
pkgname=protrekkr-git
pkgver=r687.dca6ef0
pkgrel=1
pkgdesc="Tracker program to create electronic music (like psytrance, trance goa, hard acid, IDM, chip, techno, etc.) for small sized intros, demos or games."
arch=(i686 x86_64)
url="http://pbat.ch/proj/protrekkr/"
license=(BSD)
depends=(
	liblo
	jack
	lua
)
makedepends=(
	git
	sporth
	soundpipe
	runt
)
provides=(protrekkr)
conflicts=(protrekkr)
source=("git://github.com/PaulBatchelor/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	find "${_pkgname}" -type f -exec sed -i "s|/usr/local|${pkgdir}/usr|g" {} \;
}

package() {
	cd "${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	make install

	# Copy over folders in bin not installed by make
    find "bin" -mindepth 1 -maxdepth 1 -name protrekkr -o \
		-exec cp -anr --reflink=auto "{}" "${pkgdir}/usr/share/${_pkgname}/" \;

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
