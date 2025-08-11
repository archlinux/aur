# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pvolok
pkgname=mprocs
pkgver=0.7.3
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')

provides=("${pkgname}")
makedepends=('rust')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a058a2806319a0a1ab644158b741e9a54be28540c88d15d213b820b3f97a65da')

build() {
	cd ${pkgname}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
