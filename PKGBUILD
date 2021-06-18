# Maintainer: Jack Maguire <jackmaguire1234 at gmail dot com>
pkgname=conway-gol-git
pkgver=0.5.0.r2.bb990f7
pkgrel=1
pkgdesc="Personal implementation of Conway's Game Of Life. See the README for more info."
arch=(x86_64)
url="https://gitlab.com/Epacnoss/conway-gol.git"
license=('MIT')
makedepends=('rust' 'cargo')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}")
noextract=()

pkgver () {
	printf "0.5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	git clone $url
	cd conway-gol
	
	cargo test --release
	cargo build --release

	install -Dm664 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 "target/release/conway-gol" "${pkgdir}"/usr/bin/${pkgname}
}
