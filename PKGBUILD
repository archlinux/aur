# Maintainer: Jeffrey Huang
pkgname=spwn
pkgver=0.8
pkgrel=1
pkgdesc="A language for Geometry Dash triggers. An easy way to create levels using code."
arch=('x86_64')
url="https://github.com/Spu7Nix/SPWN-language.git"
license=('MIT')
groups=()
depends=(rust libgit2)
makedepends=(git cargo)
checkdepends=()
optdepends=()
provides=()
conflicts=('spwn-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/Spu7Nix/SPWN-language.git)
sha256sums=('SKIP')

build() {
	cd "${srcdir}/SPWN-language"
    cargo build --release
}

package() {
    mkdir -p "${pkgdir}/usr/bin/spwn-bin/libraries"

	install -Dm755 "${srcdir}/SPWN-language/target/release/spwn" "${pkgdir}/usr/bin/spwn-bin/spwn"
	install -Dm755 "${srcdir}/SPWN-language/target/release/spwn" "${pkgdir}/usr/bin/spwn"
    install -Dm644 "${srcdir}/SPWN-language/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    cp -r "${srcdir}/SPWN-language/libraries/" "${pkgdir}/usr/bin/spwn-bin/"
    chmod -R 644 "${pkgdir}/usr/bin/spwn-bin/libraries"
}