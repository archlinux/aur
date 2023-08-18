# Maintainer: Nixuge

pkgname=modrinth-cli-git
_gitname=theseus
pkgver=r178.6d9d403
pkgrel=1
pkgdesc='Official Modrinth CLI launcher. Open-source, built by the community, for the community.'
url=https://github.com/modrinth/theseus
arch=(x86_64)
license=(GPL3)
conflicts=('modrinth-cli')
provides=('modrinth-cli')
makedepends=('git')
source=("git+https://github.com/modrinth/theseus")
sha256sums=('SKIP')


pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/theseus_cli/"

	cargo build --release
}

package() {
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 \
		"${srcdir}/${_gitname}/target/release/theseus_cli" \
		"${pkgdir}/usr/bin/theseus_cli"
}
