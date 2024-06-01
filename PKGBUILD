# Maintainer: Nixuge

pkgname=modrinth-cli-git
_gitname=theseus
pkgver=r229.7644701
pkgrel=1
pkgdesc='Official Modrinth CLI launcher. Open-source, built by the community, for the community.'
url=https://github.com/modrinth/theseus
arch=(x86_64)
license=(GPL3)
conflicts=('modrinth-cli')
provides=('modrinth-cli')
makedepends=('git')
# Note:
# For some unknown reason, theseus_cli has been entirely removed as of this commit:
# https://github.com/modrinth/theseus/commit/28779196393b59f06bcecbf88c77e49dc297989f
# so using the previous git commit for now, until it's added back (?)
# Tbh this doesn't build for me, but keeping it as is for reference since i'm pretty sure this is deprecated :/
# If I have time, will try and fix it.
source=("git+https://github.com/modrinth/theseus#commit=7644701")
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
