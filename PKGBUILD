# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cesarferreira
_pkgname=needle-cli
pkgname=${_pkgname}
pkgdesc="TUI that highlights the GitHub PRs that need you"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

makedepends=('rust')
depends=('glibc' 'gcc-libs')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.crate::https://crates.io/api/v1/crates/${_pkgname}/${pkgver}/download")
sha256sums=('ce1eef115b86a1688a500cba82a208c6cbf042e3f93f2db9d4de4a72e0216505')


build() {
	cd ${pkgname}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

