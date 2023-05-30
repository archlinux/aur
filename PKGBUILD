# Maintainer: Nixuge

pkgname=theseus-cli-git
_pkgname=theseus
pkgver=r135.9ea548c
pkgrel=1
pkgdesc='Official Modrinth CLI launcher. Open-source, built by the community, for the community.'
url=https://github.com/modrinth/theseus
arch=(x86_64)
license=(GPL3)
conflicts=('theseus-cli')
provides=('theseus-cli')
makedepends=()
source=("git+https://github.com/modrinth/theseus")
sha256sums=('SKIP')


pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}/theseus_cli/"

	cargo build --release
}

package() {
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 \
		"${srcdir}/${_pkgname}/target/release/theseus_cli" \
		"${pkgdir}/usr/bin/theseus_cli"
}
