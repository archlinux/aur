pkgname="openbsd-comp-mans"
pkgver=7.9
pkgvernodot=${pkgver/./}
pkgrel=1
pkgdesc="Man pages from OpenBSD's compXX.tgz file set"
url="https://www.openbsd.org/"
license=('unknown')
arch=('any')
install="${pkgname}.install"
source=("https://mirror.planetunix.net/pub/OpenBSD/${pkgver}/amd64/comp${pkgvernodot}.tgz")
sha256sums=('21a67af20aebcabf85b09f4206fc95b4cae0a35d42b154b976f0159f457724f9')
options=('!strip' '!docs' '!libtool')

build() {
	cd "${srcdir}/usr/share/man"
	find . -type f | while IFS= read -r f; do
		mv "$f" "$(dirname "$f")/o$(basename "$f")"
	done
}

package() {
	mkdir -p "${pkgdir}/usr/share"
	cp -r "${srcdir}/usr/share/man" "${pkgdir}/usr/share/man"
}

