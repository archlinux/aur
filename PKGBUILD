# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pvolok
pkgname=mprocs
pkgver=0.9.6
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')

provides=("${pkgname}")
makedepends=('rust')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('294fa02bfec7c73bc29448c55497ac46deda8b82bec259e492c51cfb67330c2d')

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
