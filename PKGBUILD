# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
pkgname=ww2ogg-git
pkgver=0.24.r2.ee9f12e
pkgrel=1
pkgdesc="Convert AudioKinetic Wwise RIFF/RIFX Vorbis to standard Ogg Vorbis"
arch=('any')
url="https://github.com/hcs64/ww2ogg"
license=('BSD-3-Clause')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}#${version}")
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm755 ww2ogg "${pkgdir}/usr/bin/ww2ogg"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 packed_codebooks.bin "${pkgdir}/usr/share/${pkgname%-git}/packed_codebooks.bin"
	install -Dm644 packed_codebooks_aoTuV_603.bin "${pkgdir}/usr/share/${pkgname%-git}/packed_codebooks_aoTuV_603.bin"
}
