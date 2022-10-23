# Maintainer: Jeffrey Huang
pkgname=spwn
pkgver=0.8
pkgrel=1
pkgdesc="A language for Geometry Dash triggers. An easy way to create levels using code."
arch=('x86_64')
url="https://github.com/Spu7Nix/SPWN-language.git"
license=('MIT')
groups=()
depends=(rust)
makedepends=(git cargo libgit2)
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
    cp -r "${srcdir}/SPWN-language/libraries/" "${pkgdir}/usr/bin/spwn-bin/"
    chmod -R 644 "${pkgdir}/usr/bin/spwn-bin/libraries"
}

post_install(){
    ln -s "${pkgdir}/usr/bin/spwn-bin/spwn" "${pkgdir}/usr/bin/spwn"
}

post_remove() {
    unlink /usr/bin/spwn
}
