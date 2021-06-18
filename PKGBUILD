# Maintainer: Jack Maguire <jackmaguire1234 at gmail dot com>
pkgname=conway-gol-git
pkgver=0.5.0.r59.cdd3494
pkgrel=1
pkgdesc="Personal implementation of Conway's Game Of Life. See the README for more info."
arch=(x86_64)
url="https://gitlab.com/Epacnoss/conway-gol.git"
license=('MIT')
makedepends=('rust' 'cargo')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
replaces=("{pkgname}-git")
noextract=()

pkgver () {
	cd "$(pkgname)"
	printf "0.5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$(pkgname)"
	cargo test
}

package() {
	cd "$(pkgname)"
	cargo build --release
	cd ../
	
	install -Dm664 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}"/usr/bin/${pkgname}
}
