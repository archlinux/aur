# Maintainer: kaij <contact@kaij.tech>
_pkgbasename=ghostty
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=r3139.01a80135
pkgdesc="👻"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/mitchellh/${_pkgbasename}"
provides=('ghostty')
conflicts=('ghostty')
license=()
# TODO: libpng is optional behind -Denable-libpng=false
depends=('bzip2' 'freetype2' 'harfbuzz' 'libpng' 'pixman' 'zlib' 'fontconfig' 'gtk4')
# zig has to include commit a5144d19b7a3585122dafbe05f7a1ce21f61a992 from Sat, 30 Sep 2023
makedepends=('git' 'zig')
source=(git+https://github.com/mitchellh/${_pkgbasename})
sha256sums=('SKIP')
            
pkgver() {
	cd "${srcdir}/${_pkgbasename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgbasename}"
	zig build -Doptimize=ReleaseFast -Dstatic=false
}

package() {
	cd "${srcdir}/${_pkgbasename}"

	install -D -m755 zig-out/bin/$_pkgbasename "${pkgdir}/usr/bin/$_pkgbasename"
	# install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
